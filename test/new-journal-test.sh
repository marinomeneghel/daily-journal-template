@test "fails with error when title arg is not passed" {
  run ~/Documents/daily-journal-template/scripts/new-journal.sh
  [ "$status" -eq 1 ]
  [ "${lines[0]}" = "No title argument supplied" ]
}

@test "checks completes correctly when title is passed" {
  run ~/Documents/daily-journal-template/scripts/new-journal.sh 'A nice title'
  [ "$status" -eq 0 ]
}
