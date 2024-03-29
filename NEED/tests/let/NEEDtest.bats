#!/usr/bin/env bats

setup() {
  cd "$(find / -type d -path '*/languages/NEED' -print -quit 2>/dev/null)"
  plccmk -c grammar > /dev/null
}

teardown() {
  rm -rf "./Java"
  cd ..
}

@test "NEED let" {

  RESULT="$(rep -n < ./tests/let/NEED.input)"

  expected_output=$(< "./tests/let/NEED.expected")
  [[ "$RESULT" == "$expected_output" ]]

}


