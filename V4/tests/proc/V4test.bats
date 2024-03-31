#!/usr/bin/env bats

setup() {
  LANGUAGE_ROOT="${BATS_TEST_DIRNAME}/../.."
  cd "${LANGUAGE_ROOT}"
  plccmk -c grammar > /dev/null
}

teardown() {
  rm -rf "./Java"
  cd ..
}

@test "V4 proc" {

  RESULT="$(rep -n < ./tests/proc/V4.input)"

  expected_output=$(< "./tests/proc/V4.expected")
  [[ "$RESULT" == "$expected_output" ]]

}


