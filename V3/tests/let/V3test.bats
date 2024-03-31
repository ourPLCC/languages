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

@test "V3 let" {

  RESULT="$(rep -n < ./tests/let/V3.input)"

  expected_output=$(< "./tests/let/V3.expected")
  [[ "$RESULT" == "$expected_output" ]]

}


