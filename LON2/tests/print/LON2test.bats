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

@test "LON2 print" {

  RESULT="$(rep -n < ./tests/print/LON2.input)"

  expected_output=$(< "./tests/print/LON2.expected")
  [[ "$RESULT" == "$expected_output" ]]

}