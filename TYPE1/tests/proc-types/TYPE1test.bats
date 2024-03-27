#!/usr/bin/env bats

setup() {
  cd "$(git rev-parse --show-toplevel)"
  cd TYPE1
  plccmk -c grammar > /dev/null
}

teardown() {
  rm -rf "./Java"
  cd ..
}

@test "TYPE1 proc-types" {

  RESULT="$(rep -n < ./tests/proc-types/TYPE1.input)"

  expected_output=$(< "./tests/proc-types/TYPE1.expected")
  [[ "$RESULT" == "$expected_output" ]]


}