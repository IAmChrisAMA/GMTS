#! /usr/bin/env zsh

# PDF for now just to test

EXT=$2                          # Extra arguments todo
IFS=$'\n'
URL_PARSE=($(wget $1 --no-check-certificate -O - -q  | grep -Eo 'href="[^\"]+.pdf"' | sed 's/href="//g' | sed  's/"//g'))


[[ ! -d "gmts" ]] && mkdir "gmts"

#echo $URL_PARSE                # Just prints the array

for i in ${URL_PARSE[@]}
do
    $(wget "$i" -P gmts/) 
done

