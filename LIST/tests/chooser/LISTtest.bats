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

@test "LIST chooser" {

  RESULT="$(rep -n < ./tests/chooser/LIST.input)"

  expected_output=$(< "./tests/chooser/LIST.expected")
  [[ "$RESULT" == "$expected_output" ]]

}