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

@test "V6 define" {

  RESULT="$(rep -n < ./tests/define/V6.input)"

  expected_output=$(< "./tests/define/V6.expected")
  [[ "$RESULT" == "$expected_output" ]]

}
