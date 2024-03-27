#!/usr/bin/env bats

setup() {
  cd "$(git rev-parse --show-toplevel)"
  cd LON2
  plccmk -c grammar > /dev/null
}

teardown() {
  rm -rf "./Java"
  cd ..
}

@test "LON2 print" {
  
  RESULT="$(rep -n < ./tests/print/LON2.input)"

  expected_output=$(< "./tests/print/LON2.expected")
  [[ "$RESULT" == "$expected_output" ]]

}