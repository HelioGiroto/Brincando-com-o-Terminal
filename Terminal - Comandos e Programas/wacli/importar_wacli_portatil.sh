#!/usr/bin/env bash
set -euo pipefail

OUT_DIR="${HOME}/whatsapp_conversas"
MEDIA_DIR="${HOME}/whatsapp_documentos"
LIMIT=5000
BAIXAR_MIDIA=1
RUN_SYNC=0

usage() {
  cat <<'EOF'
Uso:
  bash importar_wacli_portatil.sh [opcoes]

Opcoes:
  --out-dir DIR     Pasta base para as conversas (padrao: ~/whatsapp_conversas)
  --media-dir DIR   Pasta base para a midia (padrao: ~/whatsapp_documentos)
  --limit N         Itens por pagina do wacli messages list (padrao: 5000)
  --no-media        Nao baixar midia
  --sync-first      Roda "wacli sync --follow" antes de importar (nao bloqueante)
  --help            Mostra esta ajuda

Estrutura gerada:
  OUT_DIR/<grupo-ou-conversa>/mensagens.txt
  MEDIA_DIR/<grupo-ou-conversa>/
EOF
}

while [ $# -gt 0 ]; do
  case "$1" in
    --out-dir)   OUT_DIR="$2"; shift 2 ;;
    --media-dir)  MEDIA_DIR="$2"; shift 2 ;;
    --limit)      LIMIT="$2"; shift 2 ;;
    --no-media)   BAIXAR_MIDIA=0; shift ;;
    --sync-first) RUN_SYNC=1; shift ;;
    --help)       usage; exit 0 ;;
    *) echo "Opcao desconhecida: $1" >&2; usage; exit 1 ;;
  esac
done

command -v wacli >/dev/null 2>&1 || { echo "Erro: wacli nao encontrado no PATH." >&2; exit 1; }
command -v jq >/dev/null 2>&1 || { echo "Erro: jq nao encontrado no PATH." >&2; exit 1; }

mkdir -p "$OUT_DIR" "$MEDIA_DIR"
IDS_FILE="$OUT_DIR/.wacli_import_ids.txt"
MAP_FILE="${TMPDIR:-/tmp}/wacli_import_map_$$.txt"
trap 'rm -f "$MAP_FILE"' EXIT

touch "$IDS_FILE"

sanitizar() {
  local s="$1"
  s="${s//\//-}"
  s="${s//:/-}"
  s="${s//\\/-}"
  s="${s//\*/-}"
  s="${s//\?/}"
  s="${s//\"/}"
  s="${s//</}"
  s="${s//>/}"
  s="${s//|/}"
  s=$(printf '%s' "$s" | sed 's/[^a-zA-Z0-9 _.-]//g; s/[[:space:]]\+/ /g; s/^ *//; s/ *$//')
  [ -n "$s" ] || s="sem_nome"
  printf '%s' "$s"
}

carregar_mapa() {
  > "$MAP_FILE"
  wacli groups list --json 2>/dev/null | jq -r '.data[]? | select(.JID != null) | "\(.JID)\t\(.Name // .name // \"\")"' >> "$MAP_FILE" 2>/dev/null || true
  wacli chats list --json --limit 500 2>/dev/null | jq -r '.data[]? | select(.jid != null) | "\(.jid)\t\(.name // \"\")"' >> "$MAP_FILE" 2>/dev/null || true
}

resolve_nome() {
  local jid="$1"
  awk -F'\t' -v j="$jid" '$1 == j {print $2; exit}' "$MAP_FILE" 2>/dev/null || true
}

processar_msg() {
  local chat_jid="$1" msg_id="$2" sender="$3" ts="$4" text="$5" chat_name="$6" media_type="$7" filename="$8"
  [ -z "$chat_jid" ] && return 0
  [ -z "$msg_id" ] && return 0

  if grep -qxF "$msg_id" "$IDS_FILE" 2>/dev/null; then
    return 0
  fi
  printf '%s\n' "$msg_id" >> "$IDS_FILE"

  local nome_chat data_hora pasta_chat pasta_midia destino_midia
  nome_chat=$(resolve_nome "$chat_jid")
  if [ -n "$nome_chat" ]; then
    nome_chat=$(sanitizar "$nome_chat")
  else
    nome_chat=$(sanitizar "$chat_name")
  fi
  [ -n "$nome_chat" ] || nome_chat=$(sanitizar "${chat_jid//[^a-zA-Z0-9]/-}")
  pasta_chat="$OUT_DIR/$nome_chat"
  pasta_midia="$MEDIA_DIR/$nome_chat"
  mkdir -p "$pasta_chat"

  data_hora=$(date -d "$(printf '%s' "$ts" | sed 's/T/ /; s/Z//') UTC" '+%Y-%m-%d %H:%M:%S' 2>/dev/null || printf '%s' "$ts")

  printf '%s;%s;%s\n' "$sender" "$data_hora" "$text" >> "$pasta_chat/mensagens.txt"

  if [ "$BAIXAR_MIDIA" -eq 1 ] && [ -n "$media_type" ]; then
    mkdir -p "$pasta_midia"
    if [ -n "$filename" ]; then
      destino_midia="$pasta_midia/$filename"
    else
      destino_midia="$pasta_midia/"
    fi
    wacli --read-only media download --chat "$chat_jid" --id "$msg_id" --output "$destino_midia" 2>/dev/null || true
  fi
}

if [ "$RUN_SYNC" -eq 1 ]; then
  echo "Iniciando wacli sync --follow em segundo plano..."
  nohup wacli sync --follow >/tmp/wacli-sync-follow.log 2>&1 &
  sleep 2
fi

echo "Carregando mapa de grupos/chats..."
carregar_mapa

if [ ! -s "$MAP_FILE" ]; then
  echo "Aviso: nao foi possivel carregar nomes de grupos/chats. Vou usar os JIDs como nome das pastas." >&2
fi

echo "Importando mensagens..."
echo "Saida:  $OUT_DIR"
echo "Midia:  $MEDIA_DIR"
echo "Limite: $LIMIT por pagina"

before_ts=""
total=0
paginas=0

while true; do
  paginas=$((paginas + 1))
  before_flag=()
  if [ -n "$before_ts" ]; then
    before_flag=(--before "$before_ts")
  fi

  resultado=$(wacli messages list --json --limit "$LIMIT" --asc "${before_flag[@]}" 2>/dev/null || true)
  count=$(printf '%s' "$resultado" | jq '.data.messages | length' 2>/dev/null || printf '0')
  if [ -z "$count" ] || [ "$count" -eq 0 ]; then
    break
  fi

  printf '%s' "$resultado" | jq -r '
    .data.messages[]?
    | [
        (.ChatJID // ""),
        (.MsgID // ""),
        (.SenderName // .SenderJID // "desconhecido"),
        (.Timestamp // ""),
        (.DisplayText // .Text // ""),
        (.ChatName // .ChatJID // ""),
        (.MediaType // ""),
        (.Filename // "")
      ]
    | @tsv
  ' 2>/dev/null | while IFS=$'\t' read -r chat_jid msg_id sender ts text chat_name media_type filename; do
    processar_msg "$chat_jid" "$msg_id" "$sender" "$ts" "$text" "$chat_name" "$media_type" "$filename"
  done

  total=$((total + count))
  printf 'Pagina %d: %s mensagens (%s total)\n' "$paginas" "$count" "$total"

  before_ts=$(printf '%s' "$resultado" | jq -r '.data.messages[-1].Timestamp // ""' 2>/dev/null || true)
  [ -z "$before_ts" ] && break
  [ "$count" -lt "$LIMIT" ] && break
done

echo "Importacao concluida: $total mensagens em $paginas paginas."
