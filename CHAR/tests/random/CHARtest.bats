#!/usr/bin/env bats

setup() {
  cd "$(git rev-parse --show-toplevel)"
  cd CHAR
  plccmk -c grammar > /dev/null
}

teardown() {
  rm -rf "./Java"
  cd ..
}

@test "CHAR scan" {

  RESULT="$(scan -n < ./tests/random/CHAR.input)"

  expected_output=$(< "./tests/random/CHAR.expected")
  [[ "$RESULT" == "$expected_output" ]]

}