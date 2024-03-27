#!/usr/bin/env bats

setup() {
  cd "$(git rev-parse --show-toplevel)"
  cd V4
  plccmk -c grammar > /dev/null
}

teardown() {
  rm -rf "./Java"
  cd ..
}

@test "V4 proc" {

  RESULT="$(rep -n < ./tests/proc/V4.input)"

  expected_output=$(< "./tests/proc/V4.expected")
  [[ "$RESULT" == "$expected_output" ]]
  
}


