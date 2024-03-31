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

@test "RANDSCONT letrec" {

  RESULT="$(rep -n < ./tests/letrec/RANDSCONT.input)"

  expected_output=$(< "./tests/letrec/RANDSCONT.expected")
  [[ "$RESULT" == "$expected_output" ]]

}