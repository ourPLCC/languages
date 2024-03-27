#!/usr/bin/env bats

setup() {
  cd "$(git rev-parse --show-toplevel)"
  cd SET
  plccmk -c grammar > /dev/null
}

teardown() {
  rm -rf "./Java"
  cd ..
}

@test "SET let" {

  RESULT="$(rep -n < ./tests/let/SET.input)"

  expected_output=$(< "./tests/let/SET.expected")
  [[ "$RESULT" == "$expected_output" ]]

}