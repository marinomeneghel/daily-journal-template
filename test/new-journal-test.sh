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
  run ${journal_script}

  [ "$status" -eq 1 ]
  [ "${lines[0]}" = "No title argument supplied" ]
}

@test "create filename formatting input title and date" {
  stub_date

  run build_filename_from_title 'A journal title passed from shell'

  [ "$output" = "16-Mar-A-journal-title-passed-from-shell.md" ]
  [ "$status" -eq 0 ]
  unstub date
}

@test "open new jorunal for editing" {
  local filename='16-Mar-A-new-journal-title.md'
  stub_vim_file "$filename"

  run open_jorunal_for_editing $filename

  [ "${output}" = "editing new journal" ]
  [ "$status" -eq 0 ]
  unstub vim
}

@test "save jurnal to git when done editing" {
  title='A nice journal'
  stub_git $title
  run save_journal $title

  [[ "${lines[0]}" = "journal added to git" ]]
  [[ "${lines[1]}" = "journal committed" ]]
  [[ "${lines[2]}" = "journal pushed to repo " ]]
  [ "$status" -eq 0 ]
  unstub git
}

@test "test all steps are correctly called when executing script" {
  title='A new journal title'
  filename='16-Mar-A-new-journal-title.md'
  stub_date
  stub_vim_file "$filename"
  stub_git "$title"

  run ${journal_script} "$title"

  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "16-Mar-A-new-journal-title.md" ]
  [ "${lines[1]}" = "editing new journal" ]
  [ "${lines[2]}" = "journal added to git" ]
  [ "${lines[3]}" = "journal committed" ]
  [ "${lines[4]}" = "journal pushed to repo" ]
  unstub date
  unstub vim
  unstub git
}
