#!/usr/bin/env bats

setup() {
  cd "$(find / -type d -path '*/languages/V5' -print -quit 2>/dev/null)"
  plccmk -c grammar > /dev/null
}

teardown() {
  rm -rf "./Java"
  cd ..
}

@test "V5 letrec" {

  RESULT="$(rep -n < ./tests/letrec/V5.input)"

  expected_output=$(< "./tests/letrec/V5.expected")
  [[ "$RESULT" == "$expected_output" ]]

}

