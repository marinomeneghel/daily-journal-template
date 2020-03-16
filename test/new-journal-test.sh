journal_script='./bin/new-journal.sh'

setup() {
  source ${journal_script}
}

@test "fails with error when title arg is not passed" {
  run check_script_arguments
  [ "$status" -eq 1 ]
  [ "${lines[0]}" = "No title argument supplied" ]
}

@test "checks completes correctly when title is passed" {
  run check_script_arguments 'A nice title'
  [ "$status" -eq 0 ]
}

@test "formats given title adding day and month" {
  run build_filename_from_title 'A nice title'
  echo $output
  [ "$output" = "[16-Mar]-A-nice-title.md" ]
  [ "$status" -eq 0 ]
}
