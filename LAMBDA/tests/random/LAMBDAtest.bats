#!/usr/bin/env bats

setup() {
  cd "$(git rev-parse --show-toplevel)"
  cd LAMBDA
  plccmk -c grammar > /dev/null
}

teardown() {
  rm -rf "./Java"
  cd ..
}

@test "LAMBDA random" {

  RESULT="$(rep -n < ./tests/random/LAMBDA.input)"

  expected_output=$(< "./tests/random/LAMBDA.expected")
  [[ "$RESULT" == "$expected_output" ]]

}