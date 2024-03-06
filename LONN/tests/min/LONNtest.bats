#!/usr/bin/env bats

setup() {
  cd LONN
  plccmk -c grammar > /dev/null
}

teardown() {
  rm -rf "./Java"
  cd ..
}

@test "LONN min" {
  skip "Language not implemented minimun number is always 0"
  RESULT="$(rep -n < ./tests/min/LONN.input)"

  expected_output=$(< "./tests/min/LONN.expected")
  [[ "$RESULT" == "$expected_output" ]]
  
}

