#! /usr/bin/env zsh

EXT=$2
IFS=$'\n'
URL_PARSE=($(wget $1 --no-check-certificate -O - -q  | grep -Eo 'href="[^\"]+.pdf"' | sed 's/href="//g' | sed  's/"//g'))
arr=($URL_PARSE)

echo $URL_PARSE

#[[ ! -d "gmts" ]] && mkdir "gmts"
