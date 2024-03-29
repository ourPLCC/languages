#!/usr/bin/env bats

setup() {
  cd "$(find / -type d -path '*/languages/V3' -print -quit 2>/dev/null)"
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


