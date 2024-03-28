#!/usr/bin/env bats

setup() {
  cd "$(find / -type d -path '*/languages/SET' -print -quit 2>/dev/null)"
  plccmk -c grammar > /dev/null
}

teardown() {
  rm -rf "./Java"
  cd ..
}

@test "SET let" {

  RESULT="$(rep -n < ./tests/let/SET.input)"

  expected_output=$(< "./tests/let/SET.expected")
  [[ "$RESULT" == "$expected_output" ]]

}