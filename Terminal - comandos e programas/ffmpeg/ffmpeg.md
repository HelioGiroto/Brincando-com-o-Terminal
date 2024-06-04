# Tutorial de ffmpeg: 

## Script para criação de shorts da semana santa 2024:
	# junta audio com foto
	time ffmpeg -loop 1 -i 1.png -i a1.mp3 -shortest v1.mp4
	
	# corta o video em no máx 59 segundos (corta excesso):
	time ffmpeg -ss 00 -i v1.mp4 -c copy -t 00:00:59.59 short-1.mp4

	*ou (EM LOTE):*
	
	# junta cada audio com sua respectiva foto:
	time for i in {1..6}; do ffmpeg -loop 1 -i "$i".png -i a"$i".mp3 -shortest v"$i".mp4; done

	(real	15m33,427s)

	# corta cada video em tam. máx de 59 segundos:
	time for i in {1..16}; do ffmpeg -ss 00 -i v"$i".mp4 -c copy -t 00:00:59.59 short-"$i".mp4; done

	(real	0m4,685s)


## Incluir outro video entre outro original num determinado tempo:

ver - https://superuser.com/questions/1602177/combine-multiple-videos-using-ffmpeg-to-play-back-in-realtime?rq=1

	Então:
	- Corta o vídeo origem em múltiplas partes (justamente nos tempos que vai se incluir os "cortes comerciais")
	- Inclui numa lista de txt os vídeos em órdem para serem concatenados...
		- nesta lista insere entre os itens os comerciais
	- Depois junta tudo (concatena) os múltiplos vídeos.
	
	*(ver esses passos abaixo:)*
	
	
## Como cortar videos/áudios em vários/múltiplos pedaços (slice) / trim ?:

### Fontes: 
	https://superuser.com/questions/138331/using-ffmpeg-to-cut-up-video
	https://www.baeldung.com/linux/ffmpeg-split-video-parts
	https://stackoverflow.com/questions/14005110/how-to-split-a-video-using-ffmpeg-so-that-each-chunk-starts-with-a-key-frame
	
	*Em múltiplos pedaços:*
	https://superuser.com/questions/1228698/how-do-i-split-a-long-video-into-multiple-shorter-videos-efficiently

### Exemplo para corte único em vídeo:
	*Corta trecho específico (início e fim especificados):*
	**ffmpeg -i vejam.mp4 -ss 00:04:18 -to 00:05:12 -c copy output_3.mp4**
	*Corta trecho a partir de um ponto de início até 31.5 segundos após:*
	**ffmpeg -i vejam.mp4 -ss 00:04:18 -t 31.5 -c copy output_4.mp4**


### Exemplo para cortes em múltiplos pedaços IGUAIS EM TAMANHO:
	Para cortar em vários pedaços de *igual tamanho* usar o -segment:

	I found the answer. It turns out I was having problems because I didn't have the proper FFmpeg installed, but a fork of ffmpeg.

	This code works for me:

	**ffmpeg -i fff.avi -acodec copy -f segment -segment_time 10 -vcodec copy -reset_timestamps 1 -map 0 fff%d.avi**

	fff.avi is the name of the source clip. Change -segment_time 10 to the general duration you want for each segment. If you want each clip to be about 40 seconds, then use -segment_time 40. Use -an after -map 0 if you don't want the resulting clips to have sound.
	
	(FONTE: https://unix.stackexchange.com/questions/148602/ffmpeg-split-video-multiple-parts)
	

### Exemplo para cortes em múltiplos pedaços diferentes tamanhos:

	Script BASH:
	
	$ cat cuts.txt
	foo.mp4 00:00:00 00:00:01
	bar.mp4 00:01:20 00:02:00

	Then read this with a simple loop and construct your ffmpeg command:

	while read -r filename start end; do
	  ffmpeg -i "input.mp4" -ss "$start" -to "$end" -c copy "$filename"
	done < cuts.txt

	
### Outro exemplo para cortes em múltiplos pedaços:
https://creatomate.com/blog/how-to-split-videos-in-multiple-parts-using-ffmpeg

	Split into parts of a specified duration..
	The following command splits a video file into separate files of a given duration. In this case, we are extracting a video into three separate files, each of 15 seconds:

**ffmpeg -i input.mp4 -ss 00:00 -t 00:15 part1.mp4 -ss 00:15 -t 00:15 part2.mp4 -ss 00:30 -t 00:15 part3.mp4**

	The -ss 00:15 argument indicates where each part should begin.
	The -t 00:15 argument specifies the length of each part.
	Split at a given time
	Similar to above, we can split a video file at a given point. Here's how to split a video exactly 1 minute from the start, resulting in two separate clips:

**ffmpeg -i input.mp4 -t 01:00 part1.mp4 -ss 01:00 part2.mp4**

	The -t 01:00 argument specifies that part1.mp4 should be 1 minute long. Because no start time is specified, it starts at 00:00.
	The -ss 01:00 argument specifies that part2.mp4 should start at the 1-minute mark. Since no duration is specified, it is stretched to the end of the input file.


## Corte para múltiplos arquivos (simples):
https://unix.stackexchange.com/questions/1670/how-can-i-use-ffmpeg-to-split-mpeg-video-into-10-minute-chunks

**ffmpeg -i source.m4v -ss       0  -t   593.3   -c copy part1.m4v**
**ffmpeg -i source.m4v -ss   593.3  -t  551.64   -c copy part2.m4v**
**ffmpeg -i source.m4v -ss 1144.94  -t  581.25   -c copy part3.m4v**
**ffmpeg -i input.mp4  -ss 00:00:00 -to 00:10:00 -c copy output1.mp4**
**ffmpeg -i input.mp4  -ss 00:10:00 -to 00:20:00 -c copy output2.mp4**



	$ ffmpeg -i big_buck_bunny_480p_5mb.mp4 -acodec copy -f segment -segment_time 10 -vcodec copy -reset_timestamps 1 -map 0 output_time_%d.mp4
	
	Copy This command takes an input video file, big_buck_bunny_480p_5mb.mp4, and splits it into 10-second parts.

	Let’s understand each option:

	-i specifies the input file, in our case, big_buck_bunny_480p_5mb.mp4
	-acodec copy sets the audio codec for the output to copy, which means the audio stream will be copied without re-encoding
	-f segment sets the format to segment
	-segment_time 10 specifies the duration of each segment to 10 seconds
	-vcodec copy sets the video codec for the output to copy, which means the video stream will be copied without re-encoding
	-reset_timestamps 1 resets timestamps for each segment and creates segments with continuous timestamps
	-map 0 maps all the streams from input to the output
	output_time_%d.mp4 defines the naming pattern for the output files, where %d in the naming pattern is a placeholder for a numeric index
	

### Funcionou (para cortar/extrair APENAS UM PEDAÇO do arq original): 
	**time ffmpeg -ss 00 -i original.mp4 -c copy -t 60 short-1.mp4**
	
		-ss a partir deste segundo
		-i video origem
		-t cortar após t segundos (não confundir -t com -to)
		arq-vídeo de saída.

### + Exemplos: 

	use this format:

	ffmpeg <start time> <input file> <cut duration> <out file>
	eg. cut 60 second clip after 1 minute of video

	**ffmpeg -ss 00:01:00 -i "in file.mp4" -to 00:01:00 -c copy out.mp4**

	Notes:
	start time before input file is faster.
	start time after input file is accurate/precise.


### Ex com trim:
	Drop everything except from second 13 to second 58:

	**ffmpeg -i INPUT -vf trim=13:58 OUTPUT**
	
	

### Ex 2:

	You can use the -ss option to specify a start timestamp, and the -t option to specify the encoding duration.

	The following would skip the first 30 seconds, and then extract the next 10 seconds to a file called output.wmv:

	**ffmpeg -ss 30 -i input.wmv -c copy -t 10 output.wmv**
	In the above command, the timestamps are in seconds (s.msec), but timestamps can also be in HH:MM:SS.xxx format. The following is equivalent:

	**ffmpeg -ss 00:00:30.0 -i input.wmv -c copy -t 00:00:10.0 output.wmv**
	Note that -t is an output option and always needs to be specified after -i.


### Ex 3:

	For me -t option didn't work, but -vframes worked. I prefer using #frames, since I would rather cut at I-Frames and I found out GOP for video using ffprobe.

	The command line that worked for me is:

	**ffmpeg -ss 60s -i input.wmv -vframes 1800 -acodec copy -vcodec copy output.wmv**
	
	By the way, putting -ss in the front of -i makes a big difference in execution time.


### separar/ cortar áudios:

	ffmpeg -i "original.mp3" -ss 60 -to 70 "new.mp3"
	ffmpeg -ss 60 -i input-audio.aac -t 15 -c copy output.aac
	ffmpeg -i file.mkv -ss 20 -to 40 -c copy file-2.mkv
	ffmpeg -i file.mkv -ss 00:00:20 -to 00:00:40 -c copy file-2.mkv



## Juntar múltiplos videos em apenas um:

### FONTES: 
https://trac.ffmpeg.org/wiki/Concatenate
https://stackoverflow.com/questions/57887941/how-do-you-concatenate-multiple-videos-using-ffmpeg
https://video.stackexchange.com/questions/20430/how-to-concatenate-multiple-videos-with-ffmpeg

### Exemplos de unir juntar concatenar MÚLTIPLOS arquivos usando um arq txt:

	First, generate a list of videos you want to merge, e.g. using this script to create a file with all the mp4 files in the current directory (in alphabetical order):

**printf "file '%s'\n" ./*.mp4 > mylist.txt**
ou (melhor):
**for f in *.wav; do echo "file '$f'" >> mylist.txt; done**

	Then concatenate them using:

**ffmpeg -f concat -safe 0 -i mylist.txt -c copy output.mp4**

	-safe (opcional) é  para definir paths de arquivos

	*Funcionou:*
	
	*Gera um arq txt com os nomes de todos os vídeo a serem concatenados:*
	 2056  ls out*
	 2057  for f in out*; do echo "file '$f'" >> mylist.txt; done

		*gerou um arq txt assim:*
		file 'output_vejam_1.mp4'
		file 'output_vejam_2.mp4'
		file 'output_vejam_3.mp4'
		...
		
	*Une todos os vídeos em apenas um:*
	 time ffmpeg -f concat -safe 0 -i mylist.txt -c copy total.mp4
	 
	 (51 segundos)
	 
	 
	 OBS: Antes de concatenar vários vídeos, verifique se todos têm a mesma *resolução*, com o seguinte comando:
	 
	 ffprobe -v error -select_streams v -show_entries stream=width,height -of csv=p=0:s=x video-1.mp4 
	 
	 (Se for preciso mudar a resolução de uma FOTO, aqui está o comando:)
	   convert -resize 1280x720 grande.png peq.png
	   convert -resize 1280x720 -quality 72 grande.png peq.png


	
### Exemplo - repetir o mesmo vídeo 10 vezes:

	You can also loop a video. This example will loop input.mkv 10 times:

**for i in {1..10}; do printf "file '%s'\n" input.mkv >> mylist.txt; done**
**ffmpeg -f concat -i mylist.txt -c copy output.mkv**


## Como converter uma série (apresentação) de fotos/imagens em vídeo:

### Fonte: 
	https://shotstack.io/learn/use-ffmpeg-to-convert-images-to-video/
	https://superuser.com/questions/617392/ffmpeg-image-sequence-with-various-durations




## Acelerar o vídeo:

### Fontes: 
	https://duckduckgo.com/?q=ffmpeg+accelerate+video&ia=web
	https://superuser.com/questions/1261678/how-do-i-speed-up-a-video-by-60x-in-ffmpeg
	https://trac.ffmpeg.org/wiki/How%20to%20speed%20up%20/%20slow%20down%20a%20video
	https://ottverse.com/how-to-speed-up-slow-down-video-playback-using-ffmpeg/


### Funcionou: 
	- Acelerou de 60 segundos para 52 (i.é, 87% menor):
	**ffmpeg -i ok.mp4 -filter_complex "[0:v]setpts=0.87*PTS[v];[0:a]atempo=1.15[a]" -map "[v]" -map "[a]" saida.mp4**
	
	- Acelerou o dobro
	**ffmpeg -i ok.mp4 -filter_complex "[0:v]setpts=0.5*PTS[v];[0:a]atempo=2.0[a]" -map "[v]" -map "[a]" output.mp4**
	
	**time ffmpeg -i d5.mp4 -filter_complex "[0:v]setpts=0.75*PTS[v];[0:a]atempo=1.25[a]" -map "[v]" -map "[a]" d5-acelerado.mp4**
	
	
### Exemplos: 

	**ffmpeg -i entrada.mkv -r 16 -filter:v "setpts=0,25*PTS" saída.mkv**



## Colocar um texto ou imagem sobre o vídeo:

### Fontes: 
	https://www.youtube.com/watch?v=bCOnug5KHx4&t=8s
	https://stackoverflow.com/questions/17623676/text-on-video-ffmpeg
	https://www.martin-riedl.de/2020/01/03/add-a-logo-to-a-video-using-ffmpeg/
	https://video.stackexchange.com/questions/12105/add-an-image-overlay-in-front-of-video-using-ffmpeg
	https://scribbleghost.net/2019/03/08/add-text-to-a-video-with-ffmpeg/
	https://codingtube.tech/2021/10/13/ffmpeg/ffmpeg-adding-text-on-video/

	https://stackoverflow.com/questions/40480153/how-to-overlay-place-an-image-on-a-video-in-ffmpeg
	https://www.abyssale.com/generate-video/ffmpeg-overlay-image-on-video
	https://www.bannerbear.com/blog/how-to-add-a-png-overlay-on-a-video-using-ffmpeg/
	https://creatomate.com/blog/how-to-add-a-transparent-overlay-on-a-video-using-ffmpeg

	https://superuser.com/questions/713498/how-to-show-overlay-image-in-a-certain-time-span-with-ffmpeg
	https://stackoverflow.com/questions/17166739/how-to-display-image-for-particular-time-in-a-video-using-ffmpeg
	https://video.stackexchange.com/questions/25511/how-to-add-images-to-video-at-specific-timestamps-for-a-short-time

	Com imagemagick - https://unix.stackexchange.com/questions/159444/how-to-create-a-timed-video-from-still-images-with-specific-time-between-each-im

### Colocar uma imagem:

	FFmpeg basics
	FFmpeg is easy to use: The first input is our video file, the second one the logo. At the end we declare a output file name.

	ffmpeg -i video.mp4 -i logo.png output-video.mp4
	
	Adding the overlay filter
	Now we need to add the overlay filter for the merging process:

	*POSIÇÕES DE UMA IMAGEM NO VÍDEO:*
	
	*Logo superior esquerda:*
	**ffmpeg -i video.mp4 -i logo.png -filter_complex "overlay=x=10:y=10" output-video.mp4**
	
	*Logo superior direita:*
	**ffmpeg -i video.mp4 -i logo.png -filter_complex "overlay=x=main_w-overlay_w-10:y=10" output-video2.mp4**
	
	##### PARA GC's: #####
	
	*Logo inferior direita:*
	**ffmpeg -i video.mp4 -i logo.png -filter_complex "overlay=x=main_w-overlay_w-10:y=main_h-overlay_h-10" output-video3.mp4**

	*Logo inferior esquerda:*
	**ffmpeg -i video.mp4 -i logo.png -filter_complex "overlay=x=10:y=main_h-overlay_h-10" output-video4.mp4**
	
	
	The parameter “filter_complex” allows us to use filter with multiple input or outputs. As value we define the x and y position for the overlay (here an offset of 10 pixel from the top left corner).

	Positioning the *overlay*:
	
	The logo in the example above has the position in the top left corner with an additional offset of 10 pixel from the x and y position. We can use here also a formula for calculating the position. The variables main_w, main_h, overlay_w and overlay_h helps us here.

	If we want to position the logo on the top right position we need to calculate the new offset.

	overlay=x=main_w-overlay_w-10:y=10
	... y=main_h-overlay_h-10
	
	Here we use the width of the video (main_w; 1920 pixel on a full HD video) reducing by the logo size (overlay_w; 100 pixel of the logo width) and add an additional offset of 10 pixel.

	#########

	Use the modified command:

	ffmpeg -i input.mp4 -i image.png \
	-filter_complex "[0:v][1:v] overlay=W-w:H-h:enable='between(t,0,20)'" \
	-pix_fmt yuv420p -c:a copy \
	output.mp4


### Colocar um texto no video - legendas: 
	*Sintaxe final para colocar legenda em dois intervalos*
	**time ffmpeg -i vejam-clip.mp4 -vf "drawtext=text='www.faculdadebetel.edu.br':fontsize=70:fontcolor=yellow:x=680:y=930:bordercolor=black:borderw=10:enable='between(t,114,153)+between(t,177,224)'" -codec:a copy clip-completo-legenda.mp4**

	*O mais simples possivel:*
	**ffmpeg -i video.mp4 -vf "drawtext=text='Olá mundo':fontsize=24:fontcolor=white:x=10:y=10" -c:a copy output.mp4**
	
	(Frases com exclamação !, é necessário escapar: usar \!)

	*Centralizado total:*
	**ffmpeg -i video.mp4 -vf "drawtext=text='JESUS 24 HORAS':fontcolor=yellow:fontsize=24:box=1:boxcolor=black@0.5:boxborderw=5:x=(w-text_w)/2:y=(h-text_h)/2" -codec:a copy output2.mp4**

	*Colocar 2 textos:*
	**ffmpeg -i video.mp4 -vf "drawtext=text='JESUS 24 HORAS TV':fontcolor=white:fontsize=24:box=1:boxcolor=black@0.5:boxborderw=5:x=(w-text_w)/2:y=(h-text_h)/2, drawtext=text='Margem inferior direita':fontcolor=yellow:fontsize=14:x=w-tw-10:y=h-th-10" -codec:a copy output-com-2-textos.mp4**

	**ffmpeg -i input.mp4 -vf "drawtext=fontfile=/path/to/font.ttf:text='Stack Overflow':fontcolor=white:fontsize=24:box=1:boxcolor=black@0.5:boxborderw=5:x=(w-text_w)/2:y=(h-text_h)/2,drawtext=fontfile=/path/to/font.ttf:text='Bottom right text':fontcolor=black:fontsize=14:x=w-tw-10:y=h-th-10" -codec:a copy output.mp4**
	
	*Colocar um texto entre os segundos a e b:*
	**ffmpeg -i video.mp4 -vf "drawtext=text='JESUS 24 HORAS TV':fontcolor=white:fontsize=24:box=1:boxcolor=black@0.5:boxborderw=5:x=(w-text_w)/2:y=(h-text_h)/2:enable='between(t,5,10)'" -codec:a copy output2-com-tempo.mp4**
	
	**ffmpeg -i video.mp4 -vf "drawtext=text='JESUS 24 HORAS TV':fontcolor=white:fontsize=24:box=1:boxcolor=black@0.5:boxborderw=5:x=(w-text_w)/2:y=(h-text_h)/2:enable='between(t,5,10)', drawtext=text='Margem inferior direita':fontcolor=yellow:fontsize=14:x=w-tw-10:y=h-th-10" -codec:a copy output-com-2-textos.mp4**
	
	*Colocar um texto entre os segundos a - b, e depois c - d:*
	**ffmpeg -i video.mp4 -vf "drawtext=text='JESUS 24 HORAS TV':fontcolor=white:fontsize=24:box=1:boxcolor=black@0.5:boxborderw=5:x=(w-text_w)/2:y=(h-text_h)/2:enable='between(t,3,8)+between(t,12,17)'" -codec:a copy output3-com-tempo.mp4**
	
	*Colocar um texto com bordas coloridas e entre dois intervalos no vídeo:*
	**ffmpeg -i vejam-clip-reduced.mp4 -vf "drawtext=text='www.faculdadebetel.edu.br':fontsize=20:fontcolor=yellow:x=250:y=315:bordercolor=black:borderw=5:enable='between(t,114,153)+between(t,177,224)'" -codec:a copy leg-tot.mp4**

	*Com hora:*
	**ffmpeg -i input_video.mp4 -vf "drawtext=text='Timestamp\: %{pts\:hms}':fontsize=18:fontcolor=yellow:x=10:y=10" -c:a copy output_video_with_timestamp.mp4**

	*Position*
		x and y determine text position:

		Position	x:y	With 10 px padding
		Top left	x=0:y=0	x=10:y=10
		Top center	x=(w-text_w)/2:y=0	x=(w-text_w)/2:y=10
		Top right	x=w-tw:y=0	x=w-tw-10:y=10
		Centered	x=(w-text_w)/2:y=(h-text_h)/2	
		Bottom left	x=0:y=h-th	x=10:y=h-th-10
		Bottom center	x=(w-text_w)/2:y=h-th	x=(w-text_w)/2:y=h-th-10
		Bottom right	x=w-tw:y=h-th	x=w-tw-10:y=h-th-10

	Use the drawtext filter for simple text on video. If you need more complex timing, formatting, or dynamic text see the subtitles filter. This answer focuses on the drawtext filter.


	*Sombras no texto ou bordas das letras*
	Fonte: https://hhsprings.bitbucket.io/docs/programming/examples/ffmpeg/drawing_texts/drawtext.html#shadowcolor-shadowx-shadowy
	
	ffmpeg -y -filter_complex "
		color=0xAFAFAF:s=1280x720,loop=-1:size=2,
		trim=0:6,setpts=PTS-STARTPTS,
		drawtext='fontfile=c\:/Windows/Fonts/courbd.ttf:
		fontcolor=yellow:
		fontsize=45:
		x=50:y=620:
		shadowcolor=blue:shadowx=5:shadowy=-5:
		text=The quick brown fox jumps over a lazy dog.'
	"
	
	ffmpeg -i ok.mp4 -vf "drawtext=text='www.faculdadebetel.edu.br':fontsize=20:fontcolor=yellow:x=250:y=315:shadowcolor=black:shadowx=5:shadowy=-5" -c:a copy leg.mp4

	*Cor na borda / contorno das letras:*	**Funcionou:**
	ffmpeg -i ok.mp4 -vf "drawtext=text='www.faculdadebetel.edu.br':fontsize=20:fontcolor=yellow:x=250:y=315:bordercolor=black:borderw=5" -c:a copy leg3.mp4


	*Caixa de texto e espaço entre as letras:*
	... box=1:boxcolor=blue:boxborderw=5:line_spacing=32: ...


**Colocar legenda via FOR... em lote conforme número ou nome do arq:**
	for i in {1..8}
	do 
	ffmpeg -i v"$i".mp4 -vf "drawtext=text='Parte "$i"':fontcolor=yellow:fontsize=80:x=(w-text_w)/2:y=1430:enable='between(t,0,5)'" -codec:a copy Video-"$i".mp4
	done


Example
Text centered on video

Print Stack Overflow in white text onto center of video, with black background box of 50% opacity:

ffmpeg -i input.mp4 -vf "drawtext=fontfile=/path/to/font.ttf:text='Stack Overflow':fontcolor=white:fontsize=24:box=1:boxcolor=black@0.5:boxborderw=5:x=(w-text_w)/2:y=(h-text_h)/2" -codec:a copy output.mp4

The audio is stream copied in this example (like a copy and paste).
@0.5 controls background box opacity. 0.5 is 50%. Remove @0.5 if you do not want any transparency.
See the drawtext filter documentation for a complete list and explanations of options.
Preview
You can use ffplay to preview your text without having to wait for a file to encode:

ffplay -vf "drawtext=fontfile=/path/to/font.ttf:text='Stack Overflow':fontcolor=white:fontsize=24:box=1:boxcolor=black@0.5:boxborderw=5:x=(w-text_w)/2:y=(h-text_h)/2" input.mp4

Alternatively you can use mpv but the syntax is slightly different:

mpv --vf="lavfi=[drawtext=fontfile=/path/to/font.ttf:text='Stack Overflow':fontcolor=white:fontsize=24:box=1:boxcolor=black@0.5:boxborderw=5:x=(w-text_w)/2:y=(h-text_h)/2]" input.mp4
Multiple texts
You can chain multiple drawtext filters:

ffmpeg -i video.mp4 -vf "drawtext=fontfile=/path/to/font.ttf:text='JESUS 24 HORAS TV':fontcolor=white:fontsize=24:box=1:boxcolor=black@0.5:boxborderw=5:x=(w-text_w)/2:y=(h-text_h)/2, drawtext=fontfile=/path/to/font.ttf:text='Bottom right text':fontcolor=black:fontsize=14:x=w-tw-10:y=h-th-10" -codec:a copy output.mp4


### Exemplo com 2 textos: (100% ok)
**ffmpeg -i video.mp4 -vf "drawtext=text='JESUS 24 HORAS TV':fontcolor=white:fontsize=24:box=1:boxcolor=black@0.5:boxborderw=5:x=(w-text_w)/2:y=(h-text_h)/2, drawtext=text='Bottom right text':fontcolor=yellow:fontsize=14:x=w-tw-10:y=h-th-10" -codec:a copy output8.mp4**

Position
x and y determine text position:

Position	x:y	With 10 px padding
Top left	x=0:y=0	x=10:y=10
Top center	x=(w-text_w)/2:y=0	x=(w-text_w)/2:y=10
Top right	x=w-tw:y=0	x=w-tw-10:y=10
Centered	x=(w-text_w)/2:y=(h-text_h)/2	
Bottom left	x=0:y=h-th	x=10:y=h-th-10
Bottom center	x=(w-text_w)/2:y=h-th	x=(w-text_w)/2:y=h-th-10
Bottom right	x=w-tw:y=h-th	x=w-tw-10:y=h-th-10


## Exemplos:
*abaixo ele corta o video*
ffmpeg -ss 00:00:15 -t 5 -i video.mp4 -vf drawtext="fontfile=C\\:/Windows/Fonts/arial.ttf: fontsize=200: fontcolor=white: box=1: boxcolor=black@0.8: x=w-tw-100: y=100: text='This is some text right here...'" output4.mp4

ffmpeg -i input_video.mp4 -vf "drawtext=text='Hello, World!':fontsize=24:fontcolor=white:x=10:y=10" -c:a copy output_video_with_text.mp4

Texto com logo:
ffmpeg -i video.mp4 -i logo.png -filter_complex "[0:v][1:v]overlay=10:10,drawtext=text='Hello World'" -c:a copy -movflags +faststart output.mp4

Dificil (letras tipo datilografadas): https://video.stackexchange.com/questions/32414/ffmpeg-make-letters-appear-one-at-the-time-like-a-typewriter


## Colocar imagem mais texto (maneira correta) - tipo GC:

	ffmpeg -i video.mp4 -i logo.png -filter_complex "overlay=x=10:y=main_h-overlay_h-10" -c:a copy video-com-GC.mp4
	
	**ffmpeg -i video.mp4 -i logo.png -filter_complex "[0:v][1:v]overlay=x=10:y=main_h-overlay_h-10, drawtext=text='JESUS 24 HORAS':fontcolor=yellow:fontsize=54:box=1:boxcolor=black@0.5:boxborderw=5:x=200:y=h-th-40" -c:a copy -movflags +faststart GC.mp4**

	(Funciona tb sem o [0:v][1:v] - antes de overlay):
	**ffmpeg -i video.mp4 -i logo.png -filter_complex "overlay=x=10:y=main_h-overlay_h-10, drawtext=text='JESUS 24 HORAS':fontcolor=yellow:fontsize=54:box=1:boxcolor=black@0.5:boxborderw=5:x=200:y=h-th-40" -c:a copy -movflags +faststart GC3.mp4**



## Converter o vídeo de horizontal para vertical 

### Fontes: 
	https://video.stackexchange.com/questions/33485/horizontal-to-vertical-video-using-ffmpeg
	https://stackoverflow.com/questions/34675923/ffmpeg-how-to-convert-horizontal-video-169-to-vertical-video-916-with-blurre
	https://stackoverflow.com/questions/55383442/ffmpeg-how-to-convert-horizontal-video-169-to-vertical-video-916-with-black
	https://superuser.com/questions/1616224/how-to-convert-portrait-to-landscape-video

	
### Exemplos: 

Funcionou:
	**ffmpeg -i input.mp4 -lavfi "[0:v]scale=256/81*iw:256/81*ih,boxblur=luma_radius=min(h\,w)/40:luma_power=3:chroma_radius=min(cw\,ch)/40:chroma_power=1[bg];[bg][0:v]overlay=(W-w)/2:(H-h)/2,setsar=1,crop=w=iw*81/256"  output.mp4**


**ffmpeg -i input.mp4 -vf "scale=1280:720:force_original_aspect_ratio=decrease,pad=1280:720:-1:-1:color=black" output.mp4**

*Este ok:*
**ffmpeg -i input.mp4 -vf "pad=iw:2*trunc(iw*16/18):(ow-iw)/2:(oh-ih)/2,setsar=1" -c:a copy output.mp4**

- Parece melhor:
(Fonte = https://stackoverflow.com/questions/34675923/ffmpeg-how-to-convert-horizontal-video-169-to-vertical-video-916-with-blurre)

**ffmpeg -i input.mp4 -lavfi "[0:v]scale=iw:2*trunc(iw*16/18),boxblur=luma_radius=min(h\,w)/20:luma_power=1:chroma_radius=min(cw\,ch)/20:chroma_power=1[bg];[bg][0:v]overlay=(W-w)/2:(H-h)/2,setsar=1" {-other parameters} output.mp4**


**ffmpeg -i input.mp4 -lavfi "[0:v]scale=256/81*iw:256/81*ih,boxblur=luma_radius=min(h\,w)/40:luma_power=3:chroma_radius=min(cw\,ch)/40:chroma_power=1[bg];[bg][0:v]overlay=(W-w)/2:(H-h)/2,setsar=1,crop=w=iw*81/256"  output.mp4**



## Combinar UMA imagem com áudio para gerar um vídeo - ver tb slideshow:

### Fonte: 

	https://superuser.com/questions/1041816/combine-one-image-one-audio-file-to-make-one-video-using-ffmpeg
	https://stackoverflow.com/questions/63071383/merge-one-audio-file-and-one-image-file-to-create-a-video-with-ffmpeg

### Exemplos: 

Funcionou:
	**$ time ffmpeg -loop 1 -i 3.png -i parte-3.mp3 -shortest 3.mp4**

	ffmpeg -loop 1 -i img.jpg -i audio.wav -shortest out.mp4

	ffmpeg -framerate 1 -loop 1 -i image.jpg -i audio.mp3 -vf format=yuv420p -r 10 -shortest -movflags +faststart output.mp4

		real	1m23,261s
		user	4m41,857s
		sys	0m3,115s


##  Slideshow (combinar VÁRIAS imagens com o áudio):

### Fontes:
	https://trac.ffmpeg.org/wiki/Slideshow

### Exemplos:
	**SEM áudio**
	*(Mesmo tempo para cada imagem:)*
	 	ffmpeg -framerate 1/5 -i %d.png -r 60 frame60.mp4
	 	ffmpeg -framerate 1/5 -i %d.png -r 30 frame30.mp4
	 	ffmpeg -framerate 1/5 -i %d.png -r 10 frame10.mp4
	 
	 ( 5 segundos para cada imagem // -r is the framerate (fps) )

## Exemplo com arq e tempos distintos para cada imagem:
*Cria arq.txt:*
	file '1.png'
	duration 5
	file '2.png'
	duration 4
	file '3.png'
	duration 3
	file '4.png'
	duration 4
	file '4.png'
	
	(Acima não se sabe realmente se é obrigatório a última linha ser repetida)

*comando:*
	ffmpeg -f concat -i arq.txt out.mp4
	_(ver abaixo - com áudio:)_

**COM AUDIO junto (tempo perfeito):**
	**ffmpeg -f concat -i arq.txt -i audio.mp3 -c:a copy -shortest out.mp4**
	
	*use -r 1 para evitar muitos frames*
	**ffmpeg -f concat -async 1 -i fx1.txt -i 1.mp3 -r 1 -c:a copy -shortest out3.mp4**


*Este tb:*
	ffmpeg -f concat -i arq.txt -pix_fmt yuv420p out.mp4


ver: cat *.png | ffmpeg -f image2pipe -i - output.mkv


ver INPOINT e OUTPOINT:
(Inpoint só serve para videos, não funciona para slides de imagens)

	https://duckduckgo.com/?q=ffmpeg+concatenate+file+txt+with+duration&ia=web
	https://trac.ffmpeg.org/wiki/Concatenate#demuxer
	https://ffmpeg.org/ffmpeg-formats.html#concat
	https://superuser.com/questions/1615982/ffmpeg-concat-demuxing-duration-and-inpoints
	https://stackoverflow.com/questions/50301765/ffmpeg-duration-usage-in-input-text-file
	https://duckduckgo.com/?q=ffmpeg+concatenate+file+inpoint&ia=web
	https://superuser.com/questions/1250147/how-to-accurately-split-and-combine-videos-with-ffmpeg-respecting-inpoint-outpoi


## Concatenar (merge) vários vídeos/áudios em um:

### Fontes: 
	https://trac.ffmpeg.org/wiki/Concatenate#demuxer
	https://stackoverflow.com/questions/7333232/how-to-concatenate-two-mp4-files-using-ffmpeg
	

### Exemplos (concatenar vários videos em um): 
	$ cat mylist.txt
	file '/path/to/file1'
	file '/path/to/file2'
	file '/path/to/file3'
	    
	$ ffmpeg -f concat -i mylist.txt -c copy output.mp4


### + 1 exemplo:
	ffmpeg -i input1.mp3 -i input2.mp3 -i input3.mp3 -filter_complex "concat=n=3:v=0:a=1" -vn -y input.m4a

	-filter_complex "concat=n=3:v=0:a=1

	concat: concatenate filter joining streams
	n: count of input segments (= synchronized audio-video streams or audio-only or video-only stream)
	v: output video stream count
	a: output audio stream count
	-vn: disable video (-an would disable audio)
	-y: overwrite output files without prompts
	Refer man ffmpeg or ffmpeg -h full to print all options (including all format and codec specific options).
	
### + exemplo:

	# Option 1 (preferred): into a single mp4 video with AAC audio encoding
	# and original video encoding
	time ffmpeg -f concat -safe 0 -i inputs.txt -c:v copy -c:a aac output.mp4

	# Option 2: into a single .mkv video with original audio and video encoding
	time ffmpeg -f concat -safe 0 -i inputs.txt -c copy output.mkv
	
### + 1 exemplo:

	Write mp4 videos paths into file input.txt:

	file '/path/to/video1.mp4'
	file '/path/to/video2.mp4'
	and then run this:

	ffmpeg -f concat -safe 0  -i ./input.txt -c:v copy output.mp4
	
	Just this!

## Transições de vídeo com áudio:

### Fontes: 
https://ffmpeg.org/ffmpeg-filters.html#xfade

### Exemplos simples: 
ffmpeg -i first.mp4 -i second.mp4 -filter_complex xfade=transition=fade:duration=2:offset=5 output.mp4


*Fumfou!!! (com video E audio!)*

**ffmpeg -i bichos.mp4 -i cavalos.mp4 -filter_complex "xfade=transition=vertopen:offset=4:duration=1;acrossfade=d=1" off4.mp4**

	- Cada video abaixo tem 5 segundos de duração
	- a transição é de 1 segundo
	- que inicia aos 4 segundos do 1º video
	- o video saida tem um total de 9 segundos.
		(comeu 1 segundo do 1º video)
		
### Outros exemplos:
	ffmpeg -i bichos.mp4 -i cavalos.mp4 -filter_complex "[0:v][1:v]xfade=transition=fade:offset=4.5:duration=1;acrossfade=d=1" out1.mp4 

	ffmpeg -i bichos.mp4 -i cavalos.mp4 -filter_complex "xfade=transition=fade:offset=4.5:duration=1;acrossfade=d=1" output.mp4 


### Sobre o acrossfade:
ver:
https://ffmpeg.org/ffmpeg-filters.html#acrossfade
https://ayosec.github.io/ffmpeg-filters-docs/4.4.4/Filters/Audio/acrossfade.html


*Calcular o offset:*
	https://stackoverflow.com/questions/63553906/merging-multiple-video-files-with-ffmpeg-and-xfade-filter/63570355#63570355

	Tam-video-1 - transição 

	sobre o offset ver resp. #1:
		https://stackoverflow.com/questions/63553906/merging-multiple-video-files-with-ffmpeg-and-xfade-filter
	transition
	Set one of available transition effects:



*Toma captura:*
	https://trac.ffmpeg.org/wiki/Create%20a%20thumbnail%20image%20every%20X%20seconds%20of%20the%20video
	ffmpeg -i input.flv -ss 00:00:14.435 -frames:v 1 out.png



## Concatenar vários áudios com cross fade entre eles:

### Fontes: 

	https://duckduckgo.com/?q=ffmpeg+merge+audios+with+cross+fade+between+them&ia=web
	https://stackoverflow.com/questions/47437050/crossfading-between-two-audio-files-with-ffmpeg
	https://superuser.com/questions/1363461/crossfade-many-audio-files-into-one-with-ffmpeg
	https://stackoverflow.com/questions/30395469/ffmpeg-audio-crossfade?rq=4


### Exemplos: 

Use

	ffmpeg -i a.mp3 -i b.mp3
	 -filter_complex
	      "[0]atrim=0:185.0[a]; [1]atrim=80.0[b];
	       [a][b]acrossfade=d=5.0"
	 out.mp3
	 
All times are in seconds.


You can avoid that by outputting to a WAV,

	**ffmpeg -i 0.mp3 -i 1.mp3 -vn -filter_complex acrossfade=d=10:c1=tri:c2=tri out.wav**

You can output to MP3 during the final crossfade command.

You can also carry out all crossfades in one call.

Example with 4 files,

	ffmpeg -i 0.mp3 -i 1.mp3 -i 2.mp3 -i 3.mp3 -vn
	       -filter_complex "[0][1]acrossfade=d=10:c1=tri:c2=tri[a01];
		                [a01][2]acrossfade=d=10:c1=tri:c2=tri[a02];
		                [a02][3]acrossfade=d=10:c1=tri:c2=tri"
	       out.mp3	
	
	
## Converter formatos de áudio:

### Fontes:
https://stackoverflow.com/questions/3255674/convert-audio-files-to-mp3-using-ffmpeg

### Exemplos: 
	wav to mp3
	ffmpeg -i audio.wav -acodec libmp3lame audio.mp3

	ogg to mp3
	ffmpeg -i audio.ogg -acodec libmp3lame audio.mp3
	**ffmpeg -i inputFile.ogg outputFile.mp3**

	ac3 to mp3
	ffmpeg -i audio.ac3 -acodec libmp3lame audio.mp3

	aac to mp3
	ffmpeg -i audio.aac -acodec libmp3lame audio.mp3
	
	*Script:*
	for f in *.ac3
	do 
		ffmpeg -i "$f" -acodec libmp3lame -q:a 2 "${f%.*}.mp3"
	done

	**Funcionou (saida com o mesmo nome):**
		for MP3 in *.mp3
		do
		ffmpeg -i "$MP3" "${MP3%.*}.aac" 
		done
	
	
	
	
## Cortando partes em silêncio no áudio

### Fonte:
	https://stackoverflow.com/questions/25697596/using-ffmpeg-with-silencedetect-to-remove-audio-silence
	https://superuser.com/questions/1362176/how-to-trim-silence-only-from-beginning-and-end-of-mp3-files-using-ffmpeg
	https://stackoverflow.com/questions/60373332/how-to-remove-silence-from-an-audio-file-while-leaving-a-bit-of-the-otherwise-de
	https://ffmpeg.org/ffmpeg-filters.html#silenceremove
	https://ffmpeg.org/ffmpeg-filters.html#Examples-32


### Exemplos:

	*Funcionou:*
	**ffmpeg -i silencios.mp3 -af "silenceremove=start_periods=1:stop_periods=-1:start_threshold=-30dB:stop_threshold=-30dB:start_silence=0:stop_silence=0" out.mp3**

	Comparar com este:
	**ffmpeg -i silencios.mp3 -af "silenceremove=start_periods=1:stop_periods=-1:start_threshold=-30dB:stop_threshold=-30dB:start_silence=0.2:stop_silence=0.2" out2.mp3**


	An example

	**ffmpeg -i input.mp3 -af silenceremove=1:0:-50dB output.mp3**

	This removes silence

	at the beginning (indicated by the first argument 1)
	with minimum length zero (indicated by the second argument 0)
	silence is classified as anything under -50 decibels (indicated by -50dB).

	ffmpeg -i input.mp3 -af  silenceremove=stop_periods=-1:stop_duration=1:stop_threshold=-90dB output.mp3


	

## (melhor:) Fazendo slice nos silencios:

### Fonte:
	https://askubuntu.com/questions/1264779/how-to-split-an-mp3-file-by-detecting-silent-parts
	https://ffmpeg.org/ffmpeg-filters.html#silenceremove

### Exemplos:

	*Get silence with the silencedetect filter:*

	**ffmpeg -i input.mp3 -af silencedetect -f null -**
	
	Note the default minimum length for silence is set to *2 seconds*, but it can be adjusted. See *ffmpeg -h filter=silencedetect*.

	There is also a silenceremove filter.

	Example output using awk:
	**ffmpeg -i input.mp3 -af silencedetect=d=0.5 -f null - |& awk '/silencedetect/ {print $4,$5}'**
	
	Saída:
	silence_start: 1.20837
	silence_end: 1.92546
	silence_start: 3.51778
	silence_end: 4.0881
	silence_start: 6.40315
	silence_end: 7.7922
	
	Outra opção melhor: 
	Como obter saida com pipe no ffmpeg!!!: (... |& ...)
	**ffmpeg -i silencios.mp3 -af silencedetect=d=0.5 -f null - |& grep silence_**
	
	Melhor: 
	**ffmpeg -i silencios.mp3 -af silencedetect=d=0.5 -f null - |& grep silence_ | cut -d"]" -f2**
	
	Saída:
	silence_start: 26.5946
	silence_end: 27.5764 | silence_duration: 0.981875
	silence_start: 48.5695
	silence_end: 49.5621 | silence_duration: 0.992563
	silence_start: 114.031
	silence_end: 117.124 | silence_duration: 3.09265


	Após isso (?), fazemos o split:
	
	*Split:*
	There are a few methods to split.

	segment muxer

	Example of splitting with the segment muxer:
	(Números abaixo conforme saída acima)

	**ffmpeg -i input.mp3 -f segment -segment_times 1.20837,1.92546,3.51778,4.0881,6.40315,7.7922 -reset_timestamps 1 -map 0:a -c:a copy output_%03d.mp3**


	*Faz o corte:*
	Using these options will omit the silent segments but is more work to make the commands:

	ffmpeg -i input.mp3 -to 1.20837 -c copy output_01.mp3
	ffmpeg -i input.mp3 -ss 1.92546 -to 3.51778 -c copy output_02.mp3
	
	…and so on.

	Or do it in one command:

	ffmpeg -i input.mp3 -to 1.20837 -c copy output_01.mp3 -ss 1.92546 -to 3.51778 -c copy output_02.mp3
	
	As in the segment muxer command this also uses stream copy.
		
## Tamanho do áudio/video:

### Exemplos:
	ffmpeg -i semfade.mp3 -f null - |& grep -i size
	ffmpeg -i semfade.mp3 -f null - |& grep Duration
	ffmpeg -v quiet -stats -i semfade.mp3 -f null -
	mp3info -p "%S" semfade.mp3 	# arredondado

## Fade in e fade out no áudio:

### Fontes:
	https://video.stackexchange.com/questions/22085/how-to-fade-out-mp4-audio-and-video-with-ffmpeg
	https://stackoverflow.com/questions/23218906/multiple-fadein-fadeout-effects-in-one-audio-file-with-ffmpeg


### Exemplos:

	Works for me with ffmpeg 2.5.2.

	I'm using fade in and fade out audio filter, both for the duration of 3 seconds.

	**ffmpeg -i audio.mp3 -af 'afade=t=in:ss=0:d=3,afade=t=out:st=27:d=3' out.mp3**

	OBS: Se o áudio tiver apenas 27 segundos (ver st=...).

### Exemplo melhor:
	Primeiro pega o tamanho do áudio (ver acima):
	*duracao=$(mp3info -p "%S" semfade.mp3)*

	Depois joga em st=...
	
	*ffmpeg -i semfade.mp3 -af 'afade=t=in:ss=0:d=3,afade=t=out:st="$duracao":d=3' out.mp3*

	(ERRO - Mas tem que subtrair -3)


## Extrair áudio do vídeo:

### Fontes: 
	https://stackoverflow.com/questions/9913032/how-can-i-extract-audio-from-video-with-ffmpeg
	
	

## Como sobrepor um video a outro:
(Como um/2 quadro/s dentro da tela cheia)

### Exemplos: 

*Testar este:*
(Sobrepondo completamente uma imagem sobre a debaixo)
Fonte - https://superuser.com/questions/1082477/ffmpeg-overlay-video-on-another-video-in-specific-time

ffmpeg -i base_video.mp4 -i top_video.avi \
	-filter_complex "[0:0][1:0]overlay=enable='between(t\,45,50)'[out]" \
	-shortest -map [out] -map 0:1 \
	-pix_fmt yuv420p -c:a copy -c:v libx264 -crf 18 out.mp4

	(between... - é o intervalo de tempo em que top_video estará sobre)

**Funcionou + simples**
ffmpeg -i original.mp4 -i 1.png \
	-filter_complex "overlay=enable='between(t\,10,15)'" \
	-shortest -c:a copy overlay.mp4

	(a imagem 1.png deve ser do mesmo tamanho do video)


*Centraliza*
ffmpeg -i original.mp4 -i 1.png \
	-filter_complex "overlay=(W-w)/2:(H-h)/2:enable='between(t\,10,15)'" \
	-shortest -c:a copy overlay5.mp4



### Outros exemplos:
	https://stackoverflow.com/questions/35269387/ffmpeg-overlay-one-video-onto-another-video
	https://superuser.com/questions/1127002/ffmpeg-overlay-one-video-on-to-another
	https://stackoverflow.com/questions/54029929/overlay-a-video-on-another-video-at-specific-time-with-ffmpeg
	https://www.youtube.com/watch?v=h_eCMMXxwQE

	If you just want a ffmpeg command, try

ffmpeg -i input.mov -i overlay.mov \
	-filter_complex "[1:v]setpts=PTS-10/TB[a]; \
		         [0:v][a]overlay=enable=gte(t\,5):shortest=1[out]" \
	-map [out] -map 0:a \
	-c:v libx264 -crf 18 -pix_fmt yuv420p \
	-c:a copy \
	output.mov
	
	This starts the overlay at 5 seconds with the overlaid video start point being 00:15.

	setpts=PTS-10/TB is setpts=PTS+(overlay_delay-video_trim_in)/TB

	overlay=enable=gte(t\,5) is overlay=enable=gte(t\,overlay_delay)

ffmpeg -y -i two.mp4 -i inone.mp4 -filter_complex "[1:v][0:v]scale2ref[ua][b];[ua]setsar=1,format=yuva444p,colorchannelmixer=aa=0.5[u];[b][u]overlay=eof_action=pass[v]" -map [v] /sdcard/videokit/output.mp4


ffmpeg -i main.mp4 -i overlay.mov -filter_complex "[1:v]setpts=PTS-STARTPTS+10/TB[ovr];[0:v][ovr]overlay=enable=gte(t\,10):eof_action=pass,format=yuv420p[vid]" -map "[vid]" -map 0:a? -c:v libx264 -crf 23 -c:a copy -movflags +faststart output.mp4

Da fonte do Youtube (acima):
ffmpeg -i   Wildlife.wmv    -vf   "movie=input3.mp4, scale=250: -1 [inner]; [in][inner] overlay =10: 10 [out]" completed.mp4


### Outro ex.:
https://hamelot.io/visualization/using-ffmpeg-to-convert-a-set-of-images-into-a-video/
	
ffmpeg -r 60 -f image2 -s 1920x1080 -i pic%04d.png -i ~/path_to_overlay.png -filter_complex "[0:v][1:v] overlay=0:0" -vcodec libx264 -crf 25  -pix_fmt yuv420p test_overlay.mp4

	~/path_to_overlay.png is the full/relative path to the overlay image
	[0:v][1:v] joins the two video streams together, stream 1 is the set of images, stream 2 is the overlay file
	overlay=0:0 specifies the position of the overlay, in this case the overlay image is assumed to be the same size as the video so no offset is needed. The offset is specified as overlay=x:y where x is the x offset in pixels and y is the y offset in pixels


	ver tb:
	Merge two videos in ffmpeg with audio from one
	https://video.stackexchange.com/questions/27773/merge-two-videos-in-ffmpeg-with-audio-from-one
	https://duckduckgo.com/?q=FFMPEG+include+a+video+between+a+another+video&ia=web
	https://stackoverflow.com/questions/74257718/how-to-combine-a-video-with-audio-from-another-video-using-ffmpeg
	https://stackoverflow.com/questions/69359432/how-to-include-both-audios-when-overlay-video-on-video-with-ffmpeg




Inserir música / áudio:
https://stackoverflow.com/questions/38632420/how-to-add-audio-at-specific-time-on-video-using-ffmpeg



## Diminuindo o tamanho do vídeo:

### Fontes: 
	https://trac.ffmpeg.org/wiki/Scaling
	https://superuser.com/questions/624563/how-to-resize-a-video-to-make-it-smaller-with-ffmpeg
	https://unix.stackexchange.com/questions/28803/how-can-i-reduce-a-videos-size-with-ffmpeg
	https://shotstack.io/learn/crop-resize-videos-ffmpeg/

### Exemplos: 
ffmpeg -i input.avi -filter:v scale=720:-1 -c:a copy output.mkv
ffmpeg -i input.avi -vf scale="720:480" output.avi

	I use following commands to do rescaling for videos and images. For fixed width and height -

	ffmpeg -i input.avi -vf scale="720:480" output.avi
	
	and if you want to retain aspect ratio just give height as -1 and it will automatically resize based on the width -

	ffmpeg -i input.avi -vf scale="720:-1" output.avi
	
	If you want to scale based on input size e.g. lets say reduce the width/height to half you can do -

	ffmpeg -i input.avi -vf scale="iw/2:ih/2" output.avi
	
	NOTE :

	iw : input width
	ih : input height


See the FFmpeg docs on scaling for more info.

To scale to half size:
ffmpeg -i input.mkv -vf "scale=trunc(iw/4)*2:trunc(ih/4)*2" -c:v libx265 -crf 28 half_the_frame_size.mkv

One-third size:
ffmpeg -i input.mkv -vf "scale=trunc(iw/6)*2:trunc(ih/6)*2" -c:v libx265 -crf 28 a_third_the_frame_size.mkv

One-quarter size:
ffmpeg -i input.mkv -vf "scale=trunc(iw/8)*2:trunc(ih/8)*2" -c:v libx265 -crf 28 a_fourth_the_frame_size.mkv

One-fifth size:
ffmpeg -i input.mkv -vf "scale=trunc(iw/10)*2:trunc(ih/10)*2" -c:v libx265 -crf 28 a_fifth_the_frame_size.mkv

In these examples, the size is divided by twice the value and multiplied by two to ensure the pixel size is a multiple of two, which is required for some codecs, including H265.  Be aware that changing the resolution always requires re-encoding, so all the ins and outs of the other answers apply here as well.



## Convertendo um áudio mono para stereo:
### Fonte: 
	https://trac.ffmpeg.org/wiki/AudioChannelManipulation#a2monostereo

### Exemplos:
	**ffmpeg -i input.mp3 -ac 2 output.m4a**



## Tirando um "print" do video / screenshot:
Fonte: 
	https://stackoverflow.com/questions/27568254/how-to-extract-1-screenshot-for-a-video-with-ffmpeg-at-a-given-time
	https://video.stackexchange.com/questions/36766/extracting-a-screenshot-from-a-video-using-ffmpeg


	ffmpeg -ss 01:23:45 -i input -frames:v 1 -q:v 2 output.jpg
	
	
## Extrair todos os metadados de um video:

### Ver metadados:
ffprobe nome-video.mp4

### limpar os metadados:
ffmpeg -i oldfile.mp4 -codec copy -metadata title="" -metadata album="" -metadata year="" -metadata container="" -metadata artist="" -metadata comment="" newfile.mp4

ffmpeg -i ok.mp4 -codec copy -metadata creation_time="" -metadata:s:a:0 handler_name="" -metadata:s:v:0 handler_name="" ok2.mp4

ffmpeg -i 9.mp4 -codec copy -metadata creation_time="" -metadata:s:a:0 handler_name="" -metadata:s:v:0 handler_name="" -metadata title="" -metadata comment="" -metadata date="" 09.mp4


ffmpeg -i in.mp4 -c copy -map_metadata 0 -metadata:s:v:0 rotate=0 -an out.mp4

Fonte: https://superuser.com/questions/1092951/how-to-delete-a-single-metadata-item-from-an-mp4-file

ffmpeg -i 100-Leccion\ Ingles.mp3 -metadata title=$prefixo -metadata track=$prefixo -metadata album="Assimil" -c copy 100.mp3


ffplay 
