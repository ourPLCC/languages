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

@test "PROP class-property" {

  RESULT="$(rep -n < ./tests/class-property/PROP.input)"

  expected_output=$(< "./tests/class-property/PROP.expected")
  [[ "$RESULT" == "$expected_output" ]]

}

