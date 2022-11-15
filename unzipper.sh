#!/bin/bash
#decompresses repetedly compressed files

NOTDONE=true
FILE=$1

while [ "$NOTDONE" = true ]
do
	
	FILETYPE="$(file --mime-type -b "$FILE")"
	case $FILETYPE in

		application/x-bzip2)
			echo "$FILE is bzipped. bunzipping."
			bunzip2 $FILE
			echo "here is everything in pwd."
			ls
			#bunzip outputs files without the .bz2 extention or with a .out ext
			OUT="$FILE.out"
			echo "$OUT should be file.out"
			read pause
			if [ -f $OUT ]
			then
				echo "there is a file.out"
				FILE=$OUT
			elif [ $FILE = *.bz2 ]
			then
				echo "there is no file.out"
				BZ=$FILE
				#stripping ".bz2" off of file
				FILE=${BZ%.*2}
				echo "$BZ is BZ"
				echo "$FILE is FILE"		
			fi
			read pause
			;;

		application/x-tar)
			echo "$FILE is a tar archive. extracting."
			CONTENTS="$(tar tf $FILE)"
			tar xvf $FILE
			#contents must be only 1 file
			FILE=$CONTENTS
			;;

		application/gzip)
			echo "$FILE is gzipped. gunzipping"
			gunzip -c $FILE > NEWFILE
			mv NEWFILE CURRFILE
			FILE=CURRFILE
			;;

		text/plain)
			echo "filetype is - $FILETYPE"
			LINECOUNT="$(wc -l "$FILE")"
			if [ "$LINECOUNT" = "1 $FILE" ]
			then
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

