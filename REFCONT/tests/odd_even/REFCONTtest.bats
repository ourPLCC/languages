#!/usr/bin/env bats

setup() {
  cd "$(find / -type d -path '*/languages/REFCONT' -print -quit 2>/dev/null)"
  plccmk -c grammar > /dev/null
}

teardown() {
  rm -rf "./Java"
  cd ..
  
}

@test "REFCONT odd_even" {
  
  RESULT="$(rep -n < ./tests/odd_even/REFCONT.input)"

  expected_output=$(< "./tests/odd_even/REFCONT.expected")
  [[ "$RESULT" == "$expected_output" ]]

}