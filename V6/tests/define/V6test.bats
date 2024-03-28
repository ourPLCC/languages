#!/usr/bin/env bats

setup() {
  cd "$(find / -type d -path '*/languages/V6' -print -quit 2>/dev/null)"
  plccmk -c grammar > /dev/null
}

teardown() {
  rm -rf "./Java"
  cd ..
}

@test "V6 define" {

  RESULT="$(rep -n < ./tests/define/V6.input)"

  expected_output=$(< "./tests/define/V6.expected")
  [[ "$RESULT" == "$expected_output" ]]

}
