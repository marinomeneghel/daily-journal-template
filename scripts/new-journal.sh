#!/bin/bash

if [ $# -eq 0 ]
then
  echo "No title argument supplied"
  exit 1
fi

title=$1
currentdate=`date +"%d-%b"`
formattedtitle=${title// /-}

