echo -en "\033]1; Bash Photos and Videos Renamer \007"
clear

#This script uses the Exiftool software.
#It can be downloaded at https://exiftool.org/
#Make sure it's in your system and accessible via $PATH before running this script.

#The purpose of this script is to automate the renaming of photo and video files
#according to the media's date of creation (note that this isn't the *file* creation date)
#and also allow for an extra tag to be appended to the filename, if desired.

#Not all kinds of files are supported, only some of the most popular.

while true
do
	read -p "Enter the directory path where the media is: " DIR
	read -p "Add the extra tag (leave blank and press Enter for no tag): " TAG
	clear
	sleep .8

	if [ -z "$TAG" ]
	then

	echo "Processing videos..."
		echo "Processing files of type MOV..."
			exiftool -progress -preserve '-FileName<${CreateDate}%+c.%e' -d %Y.%m.%d_%Hh%Mm%Ss -api QuickTimeUTC -ext mov "$DIR"
			sleep .8
		echo "Processing files of type MP4..."
			exiftool -progress -preserve '-FileName<${CreateDate}%+c.%e' -d %Y.%m.%d_%Hh%Mm%Ss -api QuickTimeUTC -ext mp4 "$DIR"
			sleep .8
		echo "Processing files of type 3gp..."
			exiftool -progress -preserve '-FileName<${CreateDate}%+c.%e' -d %Y.%m.%d_%Hh%Mm%Ss -api QuickTimeUTC -ext 3gp "$DIR"
			sleep .8
	clear

	echo "Processing photos..."
		echo "Processing files of type JPG..."
			exiftool -progress -preserve '-FileName<${DateTimeOriginal}%+c.%e' -d %Y.%m.%d_%Hh%Mm%Ss -ext jpg "$DIR"
			sleep .8
		echo "Processing files of type JPEG..."
			exiftool -progress -preserve '-FileName<${DateTimeOriginal}%+c.%e' -d %Y.%m.%d_%Hh%Mm%Ss -ext jpeg "$DIR"
			sleep .8
		echo "Processing files of type HEIC..."
			exiftool -progress -preserve '-FileName<${DateTimeOriginal}%+c.%e' -d %Y.%m.%d_%Hh%Mm%Ss -ext HEIC "$DIR"
			sleep .8
		echo "Processing files of type CR2..."
			exiftool -progress -preserve '-FileName<${DateTimeOriginal}%+c.%e' -d %Y.%m.%d_%Hh%Mm%Ss -ext CR2 "$DIR"
			sleep .8
	else

	echo "Processing videos..."
		echo "Processing files of type MOV..."
			exiftool -progress -preserve '-FileName<${CreateDate}%+c.%e' -d "%Y.%m.%d_%Hh%Mm%Ss $TAG" -api QuickTimeUTC -ext mov "$DIR"
			sleep .8
		echo "Processing files of type MP4..."
			exiftool -progress -preserve '-FileName<${CreateDate}%+c.%e' -d "%Y.%m.%d_%Hh%Mm%Ss $TAG" -api QuickTimeUTC -ext mp4 "$DIR"
			sleep .8
		echo "Processing files of type 3gp..."
			exiftool -progress -preserve '-FileName<${CreateDate}%+c.%e' -d "%Y.%m.%d_%Hh%Mm%Ss $TAG" -api QuickTimeUTC -ext 3gp "$DIR"
			sleep .8
	clear

	echo "Processing photos..."
		echo "Processing files of type JPG..."
			exiftool -progress -preserve '-FileName<${DateTimeOriginal}%+c.%e' -d "%Y.%m.%d_%Hh%Mm%Ss $TAG" -ext jpg "$DIR"
			sleep .8
		echo "Processing files of type JPEG..."
			exiftool -progress -preserve '-FileName<${DateTimeOriginal}%+c.%e' -d "%Y.%m.%d_%Hh%Mm%Ss $TAG" -ext jpeg "$DIR"
			sleep .8
		echo "Processing files of type HEIC..."
			exiftool -progress -preserve '-FileName<${DateTimeOriginal}%+c.%e' -d "%Y.%m.%d_%Hh%Mm%Ss $TAG" -ext HEIC "$DIR"
			sleep .8
		echo "Processing files of type CR2..."
			exiftool -progress -preserve '-FileName<${DateTimeOriginal}%+c.%e' -d "%Y.%m.%d_%Hh%Mm%Ss $TAG" -ext CR2 "$DIR"
			sleep .8
	fi

	clear

	echo 'Repeat the operation for another directory? Select the appropriate number: '
	select repeat in Yes No
		do
			case $repeat in
				"Yes")
				unset TAG; unset DIR; clear; break;;
				"No")
				unset TAG; unset DIR; exit;;
				*)
				echo "Try again...";;
			esac
		done
done
