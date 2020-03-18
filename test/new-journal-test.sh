#!/bin/bash

load helpers/mocks/stub

journal_script='./bin/new-journal.sh'

setup() {
  source ${journal_script}
}

stub_date() {
  _DATE_ARGS='+%d-%b'
  stub date \
    "${_DATE_ARGS} : echo 16-Mar"
}
stub_vim_file() {
  stub vim \
    "\"$1\" : echo FUCK"
}

@test "fails with error when title arg is not passed" {
  run check_script_arguments

  [ "$status" -eq 1 ]
  [ "${lines[0]}" = "No title argument supplied" ]
}

@test "create filename formatting title and date" {
  stub_date

  run build_filename_from_title 'A nice title'

  [ "$output" = "[16-Mar]-A-nice-title.md" ]
  [ "$status" -eq 0 ]
  unstub date
}

@test "open new jorunal for editing" {
  filename='[16-Mar]-Time-to-write-a-journal.md'
  stub_vim_file $filename

  run open_jorunal_for_editing $filename

  echo $output
  [ "$output" = "FUCK" ]
  [ "$status" -eq 0 ]
  unstub vim
}







