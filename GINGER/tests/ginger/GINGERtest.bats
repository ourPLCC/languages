#!/usr/bin/env bats

setup() {
  cd "$(find / -type d -path '*/languages/GINGER' -print -quit 2>/dev/null)"
  plccmk -c grammar > /dev/null
}

teardown() {
  rm -rf "./Java"
  cd ..
}

@test "GINGER ginger" {

  RESULT="$(rep -n < ./tests/ginger/GINGER.input)"

  expected_output=$(< "./tests/ginger/GINGER.expected")
  [[ "$RESULT" == "$expected_output" ]]

}