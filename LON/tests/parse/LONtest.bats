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

@test "LON parse" {

  RESULT="$(parse -n < ./tests/parse/LON.input)"

  [[ "$RESULT" =~ .*OK.* ]]

}