#!/bin/bash

[ -z "$1" ] && echo "No title argument supplied"; exit 1

title=$0
currentdate=`date +"%d-%b"`
formattedtitle=${title// /-}

filename=[$currentdate]-$formattedtitle.md
touch ~/Documents/daily-journal/$filename

vim ~/Documents/daily-journal/$filename

cd ~/Documents/daily-journal
# git add "$filename"
# git commit -m "$title"
# git push origin master

echo "<<< new journal committed and pushed"
