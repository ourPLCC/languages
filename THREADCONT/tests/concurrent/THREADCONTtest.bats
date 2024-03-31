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

@test "THREADCONT concurrent" {

  RESULT="$(rep -n < ./tests/concurrent/THREADCONT.input)"

  expected_output=$(< "./tests/concurrent/THREADCONT.expected")
  [[ "$RESULT" == "$expected_output" ]]

}