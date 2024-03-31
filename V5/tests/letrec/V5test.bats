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

@test "V5 letrec" {

  RESULT="$(rep -n < ./tests/letrec/V5.input)"

  expected_output=$(< "./tests/letrec/V5.expected")
  [[ "$RESULT" == "$expected_output" ]]

}

