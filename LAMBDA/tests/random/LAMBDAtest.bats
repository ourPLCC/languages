#!/usr/bin/env bats

setup() {
  cd "$(find / -type d -path '*/languages/LAMBDA' -print -quit 2>/dev/null)"
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