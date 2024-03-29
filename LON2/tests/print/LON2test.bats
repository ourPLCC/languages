#!/usr/bin/env bats

setup() {
  cd "$(find / -type d -path '*/languages/LON2' -print -quit 2>/dev/null)"
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