#!/usr/bin/env bats

setup() {
  cd V2
  plccmk -c grammar > /dev/null
}

teardown() {
  rm -rf "./Java"
  cd ..
}

@test "V2 nested-ifs" {

  RESULT="$(rep -n < ./tests/nested-ifs/V2.input)"

  expected_output=$(< "./tests/nested-ifs/V2.expected")
  [[ "$RESULT" == "$expected_output" ]]
  
}

