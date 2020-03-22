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
  _VIM_ARGS=$1
  stub vim \
    "${_VIM_ARGS} : echo editing new journal"
}

stub_git() {
  local commit_message=$1
  _GIT_ADD_ARGS='add --all'
  _GIT_COMMIT_ARGS="commit -m ${commit_message}"
  _GIT_PUSH_ARGS='push origin master'
  stub git \
    "${_GIT_ADD_ARGS} : echo journal added to git" \
    "${_GIT_COMMIT_ARGS} : echo journal committed" \
    "${_GIT_PUSH_ARGS} : echo journal pushed to repo"
}

@test "fails with error when title arg is not passed" {
  run check_script_arguments

  [ "$status" -eq 1 ]
  [ "${lines[0]}" = "No title argument supplied" ]
}

@test "create filename formatting title and date" {
  stub_date

  run build_filename_from_title 'A nice title'

  [ "$output" = "16-Mar-A-nice-title.md" ]
  [ "$status" -eq 0 ]
  unstub date
}

@test "open new jorunal for editing" {
  filename='16-Mar-A-nice-title.md'
  stub_vim_file $filename

  run open_jorunal_for_editing $filename

  [ "$output" = "editing new journal" ]
  [ "$status" -eq 0 ]
  unstub vim
}

@test "save jurnal to git when done editing" {
  title='A nice journal'
  stub_git $title
  run save_journal $title

  echo "output= $output"
  [[ "$output" =~ "journal added to git" ]]
  [[ "$output" =~ "journal committed" ]]
  [[ "$output" =~ "journal pushed to repo " ]]
  [ "$status" -eq 0 ]
  unstub git
}

