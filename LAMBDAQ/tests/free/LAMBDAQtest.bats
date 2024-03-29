#!/usr/bin/env bats

setup() {
  cd "$(find / -type d -path '*/languages/LAMBDAQ' -print -quit 2>/dev/null)"
  plccmk -c grammar > /dev/null
}

teardown() {
  rm -rf "./Java"
  cd ..
}

@test "LAMBDAQ occurs_free" {
  
  RESULT="$(rep -n < ./tests/free/LAMBDAQ.input)"

  expected_output=$(< "./tests/free/LAMBDAQ.expected")
  [[ "$RESULT" == "$expected_output" ]]

}