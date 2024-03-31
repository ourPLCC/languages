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

@test "LAMBDA random" {

  RESULT="$(rep -n < ./tests/random/LAMBDA.input)"

  expected_output=$(< "./tests/random/LAMBDA.expected")
  [[ "$RESULT" == "$expected_output" ]]

}