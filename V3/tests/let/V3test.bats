#!/usr/bin/env bats

setup() {
  cd "$(git rev-parse --show-toplevel)"
  cd V3
  plccmk -c grammar > /dev/null
}

teardown() {
  rm -rf "./Java"
  cd ..
}

@test "V3 let" {

  RESULT="$(rep -n < ./tests/let/V3.input)"

  expected_output=$(< "./tests/let/V3.expected")
  [[ "$RESULT" == "$expected_output" ]]
  
}


