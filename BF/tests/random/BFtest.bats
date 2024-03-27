#!/usr/bin/env bats

setup() {
  cd "$(git rev-parse --show-toplevel)"
  cd BF
  plccmk -c grammar > /dev/null
}

teardown() {
  rm -rf "./Java"
  cd ..
}

@test "BF random" {

  RESULT="$(rep -n < ./tests/random/BF.input)"

  expected_output=$(< "./tests/random/BF.expected")
  [[ "$RESULT" == "$expected_output" ]]
  
}