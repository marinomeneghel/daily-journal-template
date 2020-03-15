@test "exit with error when title is not passed" {
  run ~/Documents/daily-journal-template/scripts/new-journal.sh
  [ "$status" -eq 1 ]
  [ "${lines[0]}" = "No title argument supplied" ]
}
