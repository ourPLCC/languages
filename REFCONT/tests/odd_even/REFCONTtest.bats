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

@test "REFCONT odd_even" {

  RESULT="$(rep -n < ./tests/odd_even/REFCONT.input)"

  expected_output=$(< "./tests/odd_even/REFCONT.expected")
  [[ "$RESULT" == "$expected_output" ]]

}