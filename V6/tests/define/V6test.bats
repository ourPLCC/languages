#!/usr/bin/env bats

setup() {
  cd "$(git rev-parse --show-toplevel)"
  cd V6
  plccmk -c grammar > /dev/null
}

teardown() {
  rm -rf "./Java"
  cd ..
}

@test "V6 define" {

  RESULT="$(rep -n < ./tests/define/V6.input)"

  expected_output=$(< "./tests/define/V6.expected")
  [[ "$RESULT" == "$expected_output" ]]

}
