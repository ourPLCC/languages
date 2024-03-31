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

@test "LAMBDAQ occurs_free" {

  RESULT="$(rep -n < ./tests/free/LAMBDAQ.input)"

  expected_output=$(< "./tests/free/LAMBDAQ.expected")
  [[ "$RESULT" == "$expected_output" ]]

}