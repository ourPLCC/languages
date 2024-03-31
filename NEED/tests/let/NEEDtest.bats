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

@test "NEED let" {

  RESULT="$(rep -n < ./tests/let/NEED.input)"

  expected_output=$(< "./tests/let/NEED.expected")
  [[ "$RESULT" == "$expected_output" ]]

}


