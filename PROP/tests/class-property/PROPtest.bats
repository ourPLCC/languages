#!/usr/bin/env bats

setup() {
  cd PROP
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

