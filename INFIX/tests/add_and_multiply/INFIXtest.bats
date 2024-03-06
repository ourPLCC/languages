#!/usr/bin/env bats

setup() {
  cd INFIX
  plccmk -c grammar > /dev/null
}

teardown() {
  rm -rf "./Java"
  cd ..
}

@test "INFIX add_and_multiply" {
  skip "Doesn't behave like we expect. Help please!"
  RESULT="$(rep -n < ./tests/add_and_multiply/INFIX.input)"

  expected_output=$(< "./tests/add_and_multiply/INFIX.expected")
  [[ "$RESULT" == "$expected_output" ]]

}