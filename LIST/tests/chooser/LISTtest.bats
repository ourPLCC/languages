#!/usr/bin/env bats

setup() {
  cd "$(find / -type d -path '*/languages/LIST' -print -quit 2>/dev/null)"
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