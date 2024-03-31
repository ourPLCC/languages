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

@test "LONN min" {
  skip "Intentionally not implemented"
  RESULT="$(rep -n < ./tests/min/LONN.input)"

  expected_output=$(< "./tests/min/LONN.expected")
  [[ "$RESULT" == "$expected_output" ]]

}

