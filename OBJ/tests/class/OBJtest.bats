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

@test "OBJ class" {

  RESULT="$(rep -n < ./tests/class/OBJ.input)"

  expected_output=$(< "./tests/class/OBJ.expected")
  [[ "$RESULT" == "$expected_output" ]]

}

