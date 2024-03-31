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

@test "CHAR scan" {

  RESULT="$(scan -n < ./tests/random/CHAR.input)"

  expected_output=$(< "./tests/random/CHAR.expected")
  [[ "$RESULT" == "$expected_output" ]]

}