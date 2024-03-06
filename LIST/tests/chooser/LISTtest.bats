#!/usr/bin/env bats

setup() {
  cd LIST
  plccmk -c grammar > /dev/null
}

teardown() {
  rm -rf "./Java"
  cd ..
}

@test "LIST chooser" {
  
  RESULT="$(rep -n < ./tests/chooser/LIST.input)"

  expected_output=$(< "./tests/chooser/LIST.expected")
  [[ "$RESULT" == "$expected_output" ]]

}