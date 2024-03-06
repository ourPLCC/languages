#!/usr/bin/env bats

setup() {
  cd TYPE0
  plccmk -c grammar > /dev/null
}

teardown() {
  rm -rf "./Java"
  cd ..
}

@test "TYPE0 boolean" {

  RESULT="$(rep -n < ./tests/boolean/TYPE0.input)"

  expected_output=$(< "./tests/boolean/TYPE0.expected")
  [[ "$RESULT" == "$expected_output" ]]

}

