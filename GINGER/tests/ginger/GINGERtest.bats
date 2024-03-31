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

@test "GINGER ginger" {

  RESULT="$(rep -n < ./tests/ginger/GINGER.input)"

  expected_output=$(< "./tests/ginger/GINGER.expected")
  [[ "$RESULT" == "$expected_output" ]]

}