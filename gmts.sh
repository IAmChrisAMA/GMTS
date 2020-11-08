#! /usr/bin/env zsh

[[ ! $1 ]] && echo "Invalid argument\n\t./gmts [EXT] [URL]"; exit

IFS=$'\n'
EXT_PARSE= ($(wget $2 --no-check-certificate -O - -q | grep -Eo 'href="[^\"]+.pdf"' | sed 's/href="//g' | sed 's/"//g'))
HTML_PARSE=($(wget $2 --no-check-certificate -O - -q | grep -Eo 'href="[^\"]+.html' | sed 's/href="//g' | sed 's/"//g'))
ARG=$1

[[ ! -d "downloads" ]] && mkdir "downloads"
[[ ! -d "downloads/rec_test" ]] && mkdir "downloads/rec_test"

for i in ${EXT_PARSE[@]}
do
    case ARG in
        '-R')    
            for i in ${HTML_PARSE[@]}
            do
                $(wget "$i" -P downloads/rec_test/) 
            done
            ;;  
        '-h')
            echo "./gmts\t.......\tGive Me That Shit\n\t-h:\n\tHelp page"; exit
            ;;
    esac
    $(wget "$i" -c -q -P downloads/)
done
