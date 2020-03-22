#!/bin/bash

check_script_arguments() {
  if [ -z "$1" ]
  then
    echo "No title argument supplied"
    exit 1
  fi
}

build_filename_from_title() {
  local title=$1
  local currentdate=$(date +%d-%b)
  local formattedtitle=${title// /-}
  echo $currentdate-$formattedtitle.md
}

open_jorunal_for_editing() {
  local filename=$1
  vim $filename
}

save_journal() {
  git add --all
  git commit -m $title
  git push origin master
}

run_main() {
  local title=$1
  check_script_arguments $title
  filename=build_filename_from_title $title
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]
then
    run_main
fi
