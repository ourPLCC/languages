#!/usr/bin/env bats

setup() {
  cd "$(find / -type d -path '*/languages/V4' -print -quit 2>/dev/null)"
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


