#!/usr/bin/env bats

setup() {
  cd ARRAY
  plccmk -c grammar > /dev/null
}

teardown() {
  rm -rf "./Java"
  cd ..
}

@test "ARRAY recursive" {

  RESULT="$(rep -n < ./tests/recursive/ARRAY.input)"

  expected_output=$(< "./tests/recursive/ARRAY.expected")
  [[ "$RESULT" == "$expected_output" ]]

}