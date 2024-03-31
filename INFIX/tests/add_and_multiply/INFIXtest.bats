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

@test "INFIX add_and_multiply" {
  skip "Intentionally not implemented"
  RESULT="$(rep -n < ./tests/add_and_multiply/INFIX.input)"

  expected_output=$(< "./tests/add_and_multiply/INFIX.expected")
  [[ "$RESULT" == "$expected_output" ]]

}