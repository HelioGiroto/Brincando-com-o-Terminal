# SCROT

- Captura a(s) tela(s) do computador e salva como arquivo png na pasta atual.
` scrot `


- O usuário pode selecionar manualmente a área da tela que deseja capturar:
` scrot --select `


- Contagem regressiva de 10 segundos antes de fazer uma captura de tela:
` scrot --count --delay 10 `


- Escolhe a pasta e nome do arquivo que será salvo:
` scrot ~/Pictures/Screenshots/%b%d::%H%M%S.png `


- Coloque esta linha em ~/.bash_aliases. Pode ser necessário fechar o terminal e reabri-lo para que o novo alias funcione: 
` alias myscrot='scrot ~/Pictures/Screenshots/%b%d::%H%M%S.png' `


- Ou adicione esta linha em .bashrc or .zshrc:
` alias scrot='scrot "/path/to/your/folder/screenshot_%Y-%m-%d_%H-%M-%S.png"' `


- Printa o monitor nro 1 depois de 5 segundos:
` scrot -d5 -M 1 `


- Printa depois de 3 segundos as coordenadas da tela:
` scrot -a 200,300,500,500 -d3 `



## Página man:

scrot(1)                                         command line screen capture utility                                         scrot(1)

NAME
       scrot - command line screen capture utility

SYNOPSIS
```
       scrot [-bcfhimopuvz] [-a X,Y,W,H] [-C NAME] [-D DISPLAY] [-d SEC] [-e CMD]
             [-F FILE] [-k OPT] [-l STYLE] [-M NUM] [-n OPTS] [-q NUM] [-S CMD] [-s OPTS]
             [-t NUM | GEOM] [FILE]
```

DESCRIPTION
       scrot (SCReenshOT) is a simple command line screen capture utility, it uses imlib2 to grab and save images.

       scrot has many useful features:

              •  Support for multiple image formats: JPG, PNG, GIF, and others.

              •  The screenshot's quality is configurable.

              •  It is possible to capture a specific window or a rectangular area on the screen.

       Because  scrot  is a command line utility, it can easily be scripted and put to novel uses. For instance, scrot can be used to
       monitor an X server in absence.

       scrot is free software under the MIT-advertising license.

OPTIONS
       -a, --autoselect X,Y,W,H 220,300,500,500
              Non-interactively choose a rectangle starting at position X,Y and of W by H resolution.
	(Para descobrir as coordenadas da tela, use: `watch -t -n 0.0001 xdotool getmouselocation `
)

       -b, --border
              When selecting a window, grab the WM's border too.  Use with -s to raise the focus of the window.

       -C, --class NAME
              NAME is a window class name. Associative with -k.

       -c, --count
              Display a countdown when used with -d.

       -D, --display DISPLAY
              DISPLAY is the display to use; see X(7).

       -d, --delay SEC
              Wait SEC seconds before taking a shot.

       -e, --exec CMD
              Execute CMD on the saved image.

       -F, --file
              File name. See SPECIAL STRINGS.

       -f, --freeze
              Freeze the screen when -s is used.

       -h, --help
              Display help and exit.

       -i, --ignorekeyboard
              Don't exit for keyboard input. ESC still exits.

       -k, --stack OPT
              Capture stack/overlapped windows and join them. A running Composite Manager is needed. OPT it's optional  join  letter:
              v/h (vertical/horizontal). Default: h

       -l, --line STYLE
              STYLE indicates the style of the line when the -s option is used; see SELECTION STYLE.

       -M, --monitor NUM
              Capture Xinerama monitor number NUM.
              (Para saber o nro de cada monitor: ` xrandr --listmonitors `)

       -m, --multidisp
              For multiple heads, screenshot all of them in order.

       -n, --note OPTS
              OPTS is a collection of options which specify notes to bake into the image. See NOTE FORMAT.

       -o, --overwrite
              By default scrot does not overwrite the output FILE, use this option to enable it.

       -p, --pointer
              Capture the mouse pointer.

       -q, --quality NUM
              NUM  must  be  between 1 and 100. For lossless output formats, a higher value represents better but slower compression.
              For lossy output formats, a higher value represents higher quality and larger file size. Default: 75.

       -S, --script CMD
              CMD is an imlib2 script.

       -s, --select OPTS
              Interactively select a window or rectangle with the mouse, use the arrow keys to resize. See the  -l  and  -f  options.
              OPTS it's optional; see SELECTION MODE

       -t, --thumb NUM | GEOM
              Also  generate a thumbnail. The argument is the resolution of the thumbnail, it may be a percentage NUM or a resolution
              GEOM. Examples: 10, 25, 320x240, 500x200.

       -u, --focused
              Use the currently focused window.

       -v, --version
              Output version information and exit.

       -z, --silent
              Prevent beeping.

       -      Redirection to standard output. The output image format is PNG.

SPECIAL STRINGS
       -e, -F and FILE parameters can take format specifiers that are expanded by scrot when encountered. There are two types of for‐
       mat specifier: Characters preceded by a '%' are interpreted by strftime(2). The second kind are internal to scrot and are pre‐
       fixed by '$'. The following specifiers are recognised by scrot:

           $$   A literal '$'.
           $a   The system's hostname.
           $f   The image's full path (ignored when used in the filename).
           $h   The image's height.
           $m   The thumbnail's full path (ignored when used in the filename).
           $n   The image's basename (ignored when used in the filename).
           $p   The image's pixel size.
           $s   The image's size in bytes (ignored when used in the filename).
           $t   The image's file format (ignored when used in the filename).
           $w   The image's width.
           $W   The name of the window (only for --select and --focused).
           \n   A literal newline (ignored when used in the filename).

       Example:

           $ scrot '%Y-%m-%d_$wx$h.png' -e 'optipng $f'

       This would create a PNG file with a name similar to 2000-10-30_2560x1024.png and optimize it with optipng(1).

SELECTION MODE
       When using -s, optionally you can indicate the action to perform with the selection area.  Some actions allow optional parame‐
       ters too.

           capture             Capture the selection area, this action is by default and
                               does not need to be specified.

           hole                Highlight the selected area overshadowing the rest of the capture.

           hide,IMAGE          Hide the selection area by drawing an area of color (or image) over it.
                               Optionally indicate name of the image to use as cover.
                               Image has priority over color.

           blur,AMOUNT         Blurs the selection area.
                               Optionally you can specify the amount of blur.
                               Amount,range: 1..30,  default: 18

       In  modes  'hole'  and  'hide' the color of the area is indicated by 'color' property of the line style and the opacity of the
       color (or image) is indicated by property 'opacity', SELECTION STYLE

       If the 'hide' mode uses an image that does not have an alpha channel, the opacity parameter will be ignored  and  it  will  be
       drawn fully opaque.

       Examples:

           $ scrot --select=hide
           $ scrot -shole --line color="Dark Salmon",opacity=200
           $ scrot -sblur,10
           $ scrot -shide,stamp.png --line opacity=120

SELECTION STYLE
       When using -s, you can indicate the style of the line with -l.

       -l takes a comma-separated list of specifiers as argument:

           style=STYLE     STYLE is either "solid" or "dash" without quotes.

           width=NUM       NUM is a pixel count between 1 and 8 inclusive.

           color="COLOR"   Color is a hexadecimal HTML color code or the name of
                           a color. HTML color codes are composed of a pound
                           sign '#' followed by a sequence of 3 2-digit
                           hexadecimal numbers which represent red, green, and
                           blue respectively. Examples: #FF0000 (red), #E0FFFF
                           (light cyan), #000000 (black).

           opacity=NUM     NUM is between 0 and 255 inclusive. 255 means
                           100% opaque, 0 means 100% transparent. For the
                           opacity of the line this is only effective if a
                           Composite Manager is running.

           mode=MODE       MODE is either "edge" or "classic" without quotes.
                           edge is the new selection, classic uses the old one.
                           "edge" ignores the style specifier and the -f flag,
                           "classic" ignores the opacity specifier.

       Without the -l option, a default style is used:

           mode=classic,style=solid,width=1,opacity=100

       Example:

           $ scrot -l style=dash,width=3,color="red" -s

NOTE FORMAT
       The -n option's argument is more arguments:

           -f  'FontName/size'
           -t  'text'
           -x  position (optional)
           -y  position (optional)
           -c  color(RGBA, range 0..255) (optional)
           -a  angle (optional)

       Example:

           $ scrot -n "-f '/usr/share/fonts/TTF/DroidSans-Bold/40' -x 10
                   -y 20 -c 255,0,0,255 -t 'Hi'"

SEE ALSO
       optipng(1)

AUTHOR
       scrot was originally developed by Tom Gilbert.

       Currently,  source  code  is  maintained  by volunteers. Newer versions are available at https://github.com/resurrecting-open-
       source-projects/scrot

scrot-1.8.1                                                  20 Jan 2023                                                     scrot(1)
