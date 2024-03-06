#!/usr/bin/env bats

setup() {
  cd V0
  plccmk -c grammar > /dev/null
}

teardown() {
  rm -rf "./Java"
  cd ..
}

@test "V0 nested-prims" {

  RESULT="$(rep -n < ./tests/nested-prims/V0.input)"

  expected_output=$(< "./tests/nested-prims/V0.expected")
  [[ "$RESULT" == "$expected_output" ]]

}