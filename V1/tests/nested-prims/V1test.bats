#!/usr/bin/env bats

setup() {
  cd "$(find / -type d -path '*/languages/V1' -print -quit 2>/dev/null)"
  plccmk -c grammar > /dev/null
}

teardown() {
  rm -rf "./Java"
  cd ..
}

@test "V1 nested-ifs" {

  RESULT="$(rep -n < ./tests/nested-prims/V1.input)"

  expected_output=$(< "./tests/nested-prims/V1.expected")
  [[ "$RESULT" == "$expected_output" ]]

}
