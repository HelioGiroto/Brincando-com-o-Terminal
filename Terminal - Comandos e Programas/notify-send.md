# NOTIFY-SEND

## Instalação

Em instalações mínimas de Linux ou em Window Managers (como i3wm, Sway ou Openbox) que não vêm com uma interface gráfica completa pré-configurada, é preciso instalar também o `dunst`:

```bash
sudo apt update
sudo apt install dunst libnotify-bin
```



## Acrescentar em `autostart`: 

( sudo gedit ~/.config/openbox/autostart )

```bash
dunst &
```

## Uso:

-   `-u, --urgency=LEVEL`: Define o nível de urgência. Os níveis são `low` (baixa), `normal` e `critical` (crítica).
-   `-t, --expire-time=TIME`: Define quanto tempo a notificação fica na tela, em milissegundos (ex: `5000` para 5 segundos). _Nota: Alguns ambientes como GNOME ignoram esta flag._
- 	`=t 0`: Faz a mensagem permanecer na tela até que se clique nela.
-   `-i, --icon=ICON`: Define o ícone da notificação. Você pode usar o nome de um ícone do sistema ou o caminho completo para uma imagem (`/path/to/image.png`).
-   `-h string:bgcolor:#00ff00`: Define a cor do fundo (background) como verde brilhante.
-   `-h string:fgcolor:#000000`: Define a cor do texto (foreground) como preto para garantir a leitura sobre o verde.
-   `-h string:frcolor:#008800`: (Opcional) Define a cor da borda (frame) para um verde mais escuro.



```bash
notify-send "Título" "Mensagem"
notify-send -u low "Baixa" "Apenas um aviso bobo."
notify-send -u normal "Normal" "Tudo sob controle."
notify-send -u critical "URGENTE" "Algo deu errado!"
notify-send -t 5000 -u critical "URGENTE" "Algo deu errado!"	# permanece 5 seg
notify-send -t 0 "Aviso Fixo" "Esta mensagem só sai se você clicar nela."
notify-send -h string:bgcolor:#00ff00 -h string:fgcolor:#000000 "AVISO" "Este é um alerta verde."

```


## Em Python 

```python 
import subprocess
# exemplos:
subprocess.run(["notify-send", "Título", "Minha mensagem aqui"])
subprocess.run(["notify-send", "-u", "critical", "Título", "Minha mensagem aqui"])

```


## Principais Aspectos: 

-   Comando Básico: `notify-send "Título" "Mensagem"` envia uma notificação padrão.
-   Personalização:
    -   Ícones: `notify-send -i icone "Título" "Texto"`.
    -   Urgência: `notify-send -u critical "Alerta" "Mensagem"`.
    -   Tempo (Timeout): O tempo padrão é ajustável, frequentemente configurado para desaparecer após alguns segundos.
-   Configuração do Sistema:
    -   Ubuntu/GNOME: Painel de "Notificações" nas configurações permite gerenciar quais aplicativos podem notificar.
    -   Linux Mint: Oferece opções para ajustar a posição (topo, fundo, esquerda, direita) e temas como Deskler, Coco, ou Nodoka.

- Automação e Dicas:

    Scripts: Útil para monitorar processos (ex: htop) e enviar alertas via terminal.
    Android: O app Android 2 Linux permite espelhar notificações do celular no Linux.
    Ntfy: Ntfyr é uma alternativa para integrações modernas. 


- Desativação Temporária:

Pode-se usar killall no serviço de notificação ativo (ex: killall dunst ou killall xfce4-notifyd). 


