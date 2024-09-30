echo -en "\033]1; Renomeador de fotos para macOS e Linux em bash \007"
clear

#Esse script utiliza o software ExifTool.
#O ExifTool pode ser baixado e consultado em https://exiftool.org/
#Certifique-se de que ele está instalado no sistema e disponível no seu $PATH.

#Esse bash script utiliza o ExifTool para automatizar a tarefa de renomear fotos e vídeos
#de acordo com a data em que foram tirados / gravados, com a possibilidade de adicionar
#uma tag ("etiqueta") extra ao nome.

#Nem todos os tipos de arquivo são suportados, apenas os mais populares.
#São os arquivos tipicamente gerados por smartphones e câmeras digitais.

while true
	do
	read -p "Insira o endereço do diretório onde estão os arquivos (não-recursivo): " DIR
	read -p "Insira palavras adicionais para acompanhar o nome de arquivo: " TAG
	clear
	sleep .8

	if [ -z "$TAG" ]
	then

	echo "Processando vídeos..."
	echo "Processando arquivos MOV..."
      	exiftool -progress -preserve '-FileName<${CreateDate}%+c.%e' -d %Y.%m.%d_%Hh%Mm%Ss -api QuickTimeUTC -ext mov "$DIR"
        sleep .8
	echo "Processando arquivos MP4..."
      	exiftool -progress -preserve '-FileName<${CreateDate}%+c.%e' -d %Y.%m.%d_%Hh%Mm%Ss -api QuickTimeUTC -ext mp4 "$DIR"
        sleep .8
	echo "Processando arquivos 3gp..."
			exiftool -progress -preserve '-FileName<${CreateDate}%+c.%e' -d %Y.%m.%d_%Hh%Mm%Ss -api QuickTimeUTC -ext 3gp "$DIR"
			sleep .8
	clear

	echo "Processando fotos..."
	echo "Processando arquivos JPG..."
      	exiftool -progress -preserve '-FileName<${DateTimeOriginal}%+c.%e' -d %Y.%m.%d_%Hh%Mm%Ss -ext jpg "$DIR"
          sleep .8
	echo "Processando arquivos JPEG..."
      	exiftool -progress -preserve '-FileName<${DateTimeOriginal}%+c.%e' -d %Y.%m.%d_%Hh%Mm%Ss -ext jpeg "$DIR"
          sleep .8
	echo "Processando arquivos HEIC..."
	      exiftool -progress -preserve '-FileName<${DateTimeOriginal}%+c.%e' -d %Y.%m.%d_%Hh%Mm%Ss -ext HEIC "$DIR"
          sleep .8
	echo "Processando arquivos CR2..."
      	exiftool -progress -preserve '-FileName<${DateTimeOriginal}%+c.%e' -d %Y.%m.%d_%Hh%Mm%Ss -ext CR2 "$DIR"
          sleep .8
	else

	echo "Processando vídeos..."
	echo "Processando arquivos MOV..."
      	exiftool -progress -preserve '-FileName<${CreateDate}%+c.%e' -d "%Y.%m.%d_%Hh%Mm%Ss $TAG" -api QuickTimeUTC -ext mov "$DIR"
          sleep .8
	echo "Processando arquivos MP4..."
      	exiftool -progress -preserve '-FileName<${CreateDate}%+c.%e' -d "%Y.%m.%d_%Hh%Mm%Ss $TAG" -api QuickTimeUTC -ext mp4 "$DIR"
          sleep .8
	echo "Processando arquivos 3gp..."
		exiftool -progress -preserve '-FileName<${CreateDate}%+c.%e' -d "%Y.%m.%d_%Hh%Mm%Ss $TAG" -api QuickTimeUTC -ext 3gp "$DIR"
			sleep .8
	clear

	echo "Processando fotos..."
	echo "Processando arquivos JPG..."
		exiftool -progress -preserve '-FileName<${DateTimeOriginal}%+c.%e' -d "%Y.%m.%d_%Hh%Mm%Ss $TAG" -ext jpg "$DIR"
			sleep .8
	echo "Processando arquivos JPEG..."
		exiftool -progress -preserve '-FileName<${DateTimeOriginal}%+c.%e' -d "%Y.%m.%d_%Hh%Mm%Ss $TAG" -ext jpeg "$DIR"
			sleep .8
	echo "Processando arquivos HEIC..."
			exiftool -progress -preserve '-FileName<${DateTimeOriginal}%+c.%e' -d "%Y.%m.%d_%Hh%Mm%Ss $TAG" -ext HEIC "$DIR"
			sleep .8
	echo "Processando arquivos CR2..."
		exiftool -progress -preserve '-FileName<${DateTimeOriginal}%+c.%e' -d "%Y.%m.%d_%Hh%Mm%Ss $TAG" -ext CR2 "$DIR"
			sleep .8
	fi

	clear

	echo 'Repetir a operação? Digite o número: '
	select repeat in Sim Não
		do
    			case $repeat in
        			"Sim")
          		  		unset TAG; unset DIR; clear; break;;
        			"Não")
           				unset TAG; unset DIR; exit;;
        			*)
           				echo "Tente de novo...";;
			esac
		done
done
