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

@test "BF random" {

  RESULT="$(rep -n < ./tests/random/BF.input)"

  expected_output=$(< "./tests/random/BF.expected")
  [[ "$RESULT" == "$expected_output" ]]

}