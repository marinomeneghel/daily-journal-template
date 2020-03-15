@test "fails with error when title arg is not passed" {
  run ~/Documents/daily-journal-template/scripts/new-journal.sh
  [ "$status" -eq 1 ]
  [ "${lines[0]}" = "No title argument supplied" ]
}

@test "checks completes correctly when title is passed" {
  skip "need to figure out how to handle the bit that opens the file for editing"
  run ~/Documents/daily-journal-template/scripts/new-journal.sh 'A nice title'
  [ "$status" -eq 0 ]
  echo $output >&3
}
