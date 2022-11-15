#!/bin/bash
#decompresses repetedly compressed files

NOTDONE=true
FILE=$1

while [ "$NOTDONE" = true ]
do
	
	FILETYPE="$(file --mime-type -b "$FILE")"
	case $FILETYPE in

		application/x-bzip2)
			echo "bunzipping."
			bunzip2 $FILE
			#bunzip outputs files without the .bz2 extention or with a .out ext
			OUT="$FILE.out"
			if [ -f $OUT ]
			then
				FILE=$OUT
			elif [ $FILE = *.bz2 ]
			then
				BZ=$FILE
				#stripping ".bz2" off of file
				FILE=${BZ%.*2}
			fi
			;;

		application/x-tar)
			echo "extracting tar archive"
			CONTENTS="$(tar tf $FILE)"
			tar xvf $FILE
			#contents must be only 1 file
			FILE=$CONTENTS
			;;

		application/gzip)
			echo "gunzipping"
			gunzip -c $FILE > NEWFILE
			mv NEWFILE CURRFILE
			FILE=CURRFILE
			;;

		text/plain)
			LINECOUNT="$(wc -l "$FILE")"
			if [ "$LINECOUNT" = "1 $FILE" ]
			then
				echo "$FILE is a normal text file"
				cat $FILE
				echo "password ^^^"
				NOTDONE=false
			else
				echo "$FILE is a hexdump"
				xxd -r $FILE > NEWFILE
				mv NEWFILE CURRFILE
				FILE=CURRFILE

			fi
			;;
		*)
			echo "there is a problem. idk what filetype this is."
			echo $FILE
			echo $FILETYPE
			read pause
			;;
	esac
done

