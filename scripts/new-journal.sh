#!/bin/bash

echo ">>> Insert Journal title"

read title
currentdate=`date +"%d-%b"`
formattedtitle=${title// /-}

filename=[$currentdate]-$formattedtitle.md
touch ~/Documents/daily-journal/$filename

vim ~/Documents/daily-journal/$filename

cd ~/Documents/daily-journal
git add "$filename"
git commit -m "$title"
git push origin master

echo "<<< new journal committed and pushed"
