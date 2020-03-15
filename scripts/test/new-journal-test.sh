@test "fails with error when title arg is not passed" {
  run ~/Documents/daily-journal-template/scripts/new-journal.sh
  [ "$status" -eq 1 ]
  [ "${lines[0]}" = "No title argument supplied" ]
}
