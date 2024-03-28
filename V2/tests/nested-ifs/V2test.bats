#!/usr/bin/env bats

setup() {
  cd "$(find / -type d -path '*/languages/V2' -print -quit 2>/dev/null)"
  plccmk -c grammar > /dev/null
}

teardown() {
  rm -rf "./Java"
  cd ..
}

@test "V2 nested-ifs" {

  RESULT="$(rep -n < ./tests/nested-ifs/V2.input)"

  expected_output=$(< "./tests/nested-ifs/V2.expected")
  [[ "$RESULT" == "$expected_output" ]]
  
}

