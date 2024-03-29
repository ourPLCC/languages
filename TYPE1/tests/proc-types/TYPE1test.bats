#!/usr/bin/env bats

setup() {
  cd "$(find / -type d -path '*/languages/TYPE1' -print -quit 2>/dev/null)"
  plccmk -c grammar > /dev/null
}

teardown() {
  rm -rf "./Java"
  cd ..
}

@test "TYPE1 proc-types" {

  RESULT="$(rep -n < ./tests/proc-types/TYPE1.input)"

  expected_output=$(< "./tests/proc-types/TYPE1.expected")
  [[ "$RESULT" == "$expected_output" ]]


}