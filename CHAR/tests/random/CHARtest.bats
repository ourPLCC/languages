#!/usr/bin/env bats

setup() {
  cd "$(find / -type d -path '*/languages/CHAR' -print -quit 2>/dev/null)"
  plccmk -c grammar > /dev/null
}

teardown() {
  rm -rf "./Java"
  cd ..
}

@test "CHAR scan" {

  RESULT="$(scan -n < ./tests/random/CHAR.input)"

  expected_output=$(< "./tests/random/CHAR.expected")
  [[ "$RESULT" == "$expected_output" ]]

}