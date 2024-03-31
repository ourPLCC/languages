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

@test "REF let" {

  RESULT="$(rep -n < ./tests/let/REF.input)"

  expected_output=$(< "./tests/let/REF.expected")
  [[ "$RESULT" == "$expected_output" ]]

}

