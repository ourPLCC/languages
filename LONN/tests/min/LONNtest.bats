#!/usr/bin/env bats

setup() {
  cd "$(find / -type d -path '*/languages/LONN' -print -quit 2>/dev/null)"
  plccmk -c grammar > /dev/null
}

teardown() {
  rm -rf "./Java"
  cd ..
}

@test "LONN min" {
  skip "Intentionally not implemented"
  RESULT="$(rep -n < ./tests/min/LONN.input)"

  expected_output=$(< "./tests/min/LONN.expected")
  [[ "$RESULT" == "$expected_output" ]]
  
}

