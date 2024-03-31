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

@test "HANDLER list" {

  RESULT="$(rep -n < ./tests/list/HANDLER.input)"

  expected_output=$(< "./tests/list/HANDLER.expected")
  [[ "$RESULT" == "$expected_output" ]]

}