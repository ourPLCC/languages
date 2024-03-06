#!/usr/bin/env bats

setup() {
  cd NAME
  plccmk -c grammar > /dev/null
}

teardown() {
  rm -rf "./Java"
  cd ..
}

@test "NAME let-proc" {

  RESULT="$(rep -n < ./tests/let-proc/NAME.input)"

  expected_output=$(< "./tests/let-proc/NAME.expected")
  [[ "$RESULT" == "$expected_output" ]]

}

