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

@test "ARRAY recursive" {

  RESULT="$(rep -n < ./tests/recursive/ARRAY.input)"

  expected_output=$(< "./tests/recursive/ARRAY.expected")
  [[ "$RESULT" == "$expected_output" ]]

}