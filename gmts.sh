#! /usr/bin/env zsh

EXT=$2
IFS=$'\n'
URL_PARSE=($(wget $1 --no-check-certificate -O - -q  | grep -Eo 'href="[^\"]+.pdf"' | sed 's/href="//g' | sed  's/"//g'))
# PDF for now just to test

[[ ! -d "gmts" ]] && mkdir "gmts"

echo $URL_PARSE

for i in ${URL_PARSE[@]}
do
    $(wget "$i" -P gmts/) 
done

