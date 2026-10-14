# YT-DLP

yt-dlp = "youtube downloader" (fork do antigo youtube-dl).

É uma linha de comando gratuita e open source para baixar vídeos e áudios de centenas de sites (YouTube, Vimeo, Twitter/X, Facebook, Twitch, etc.).

O que faz:
- Baixa vídeos em várias qualidades (720p, 4K, etc.)
- Extrai apenas o áudio (como fizemos: -x --audio-format mp3)
- Baixa legendas, thumbnails e playlists inteiras
- Corta vídeos por tempo (--download-sections)
- Funciona com muito mais sites que o próprio YouTube

Exemplos:

yt-dlp "URL"                          # baixa vídeo na melhor qualidade
yt-dlp -x --audio-format mp3 "URL"    # só o áudio em mp3
yt-dlp -f bestvideo+bestaudio "URL"   # vídeo + áudio separados (melhor qualidade)
yt-dlp --playlist "URL"               # playlist inteira

É o padrão da comunidade para esse tipo de tarefa — gratuito, sem anúncios, sem limite de qualidade.

## INSTALAÇÃO

Duas opções principais:

1. Binário oficial em /usr/local/bin (recomendado):

Instalar/atualizar:

`sudo curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o /usr/local/bin/yt-dlp`
`sudo chmod a+rx /usr/local/bin/yt-dlp`

2. Via pip (precisa de --break-system-packages no Debian/Ubuntu recente):
`sudo python3 -m pip install -U yt-dlp --break-system-packages`

Depois de instalado por qualquer uma dessas formas, basta rodar:

`sudo yt-dlp -U`

Obs.: se instalar via apt install yt-dlp, o yt-dlp -U não funciona — nesse caso use:
`sudo apt update && sudo apt install yt-dlp`, mas o pacote do apt costuma vir desatualizado (como estava o seu).


## OBTENDO TODOS OS URLs DE UM CANAL

yt-dlp --flat-playlist --print webpage_url "https://www.youtube.com/@NOMEDOCANAL/videos"

Explicação:
- --flat-playlist — só lista os itens, sem analisar cada vídeo (muito rápido)
- --print webpage_url — imprime apenas a URL de cada vídeo
- /videos — aba de vídeos do canal (também funcionam /shorts e /streams)

Outros exemplos:

```sh
# salvar em arquivo
yt-dlp --flat-playlist --print webpage_url "URL_DO_CANAL/videos" > urls.txt

# playlists do canal
yt-dlp --flat-playlist --print webpage_url "URL_DO_CANAL/playlists"

# playlist específica
yt-dlp --flat-playlist --print webpage_url "https://www.youtube.com/playlist?list=PL..."
Também funciona com ID em vez de URL (--print id), ou título (--print title).
```

## TRANSCRIÇÕES DE VÍDEOS

Listar legendas disponíveis:
yt-dlp --list-subs "URL"

Baixar legendas/transcrições:

```sh
# legendas manuais (se existirem)
yt-dlp --skip-download --write-subs --sub-langs "pt.*" "URL"

# legendas automáticas (geradas pelo YouTube, quase sempre existem)
yt-dlp --skip-download --write-auto-subs --sub-langs "pt.*" "URL"
Explicação:
- --skip-download — não baixa o vídeo, só as legendas
- --write-subs — legendas manuais
- --write-auto-subs — legendas automáticas (transcrição do YouTube)
- --sub-langs "pt.*" — filtra por idioma (ex.: pt, pt-BR, en.*); use "all" para todos
Formatos úteis:

# como texto simples (mais fácil de ler)
yt-dlp --skip-download --write-auto-subs --sub-langs "pt.*" --sub-format vtt/srt/best "URL"

# converter para .srt automaticamente
yt-dlp --skip-download --write-auto-subs --sub-langs "pt.*" --sub-format "srt" "URL"

Para playlist/canal inteiro, troque URL pela URL de playlist e adicione --flat-playlist não ajuda aqui — deixe sem, pois é preciso consultar cada vídeo para as legendas.

# Exemplo em massa (só transcrições pt-BR de um canal):
yt-dlp --skip-download --write-auto-subs --sub-langs "pt.*" --sub-format "vtt" \
  -o "%(title)s.%(ext)s" "https://www.youtube.com/@NOMEDOCANAL/videos"
```

  


