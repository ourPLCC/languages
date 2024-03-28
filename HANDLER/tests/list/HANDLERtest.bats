#!/usr/bin/env bats

setup() {
  cd "$(find / -type d -path '*/languages/HANDLER' -print -quit 2>/dev/null)"
  plccmk -c grammar > /dev/null
}

teardown() {
  rm -rf "./Java"
  cd ..
}

@test "HANDLER list" {

  RESULT="$(rep -n < ./tests/list/HANDLER.input)"

  expected_output=$(< "./tests/list/HANDLER.expected")
  [[ "$RESULT" == "$expected_output" ]]

}