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
