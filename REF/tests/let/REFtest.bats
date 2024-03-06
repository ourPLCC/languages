#!/usr/bin/env bats

setup() {
  cd REF
  plccmk -c grammar > /dev/null
}

teardown() {
  rm -rf "./Java"
  cd ..
}

@test "REF let" {

  RESULT="$(rep -n < ./tests/let/REF.input)"

  expected_output=$(< "./tests/let/REF.expected")
  [[ "$RESULT" == "$expected_output" ]]

}

