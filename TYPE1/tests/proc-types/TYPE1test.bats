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

@test "TYPE1 proc-types" {

  RESULT="$(rep -n < ./tests/proc-types/TYPE1.input)"

  expected_output=$(< "./tests/proc-types/TYPE1.expected")
  [[ "$RESULT" == "$expected_output" ]]


}