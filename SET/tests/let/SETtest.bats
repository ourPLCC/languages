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

@test "SET let" {

  RESULT="$(rep -n < ./tests/let/SET.input)"

  expected_output=$(< "./tests/let/SET.expected")
  [[ "$RESULT" == "$expected_output" ]]

}