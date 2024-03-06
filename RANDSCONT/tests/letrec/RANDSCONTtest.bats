#!/usr/bin/env bats

setup() {
  cd RANDSCONT
  plccmk -c grammar > /dev/null
}

teardown() {
  rm -rf "./Java"
  cd ..
}

@test "RANDSCONT letrec" {
  
  RESULT="$(rep -n < ./tests/letrec/RANDSCONT.input)"

  expected_output=$(< "./tests/letrec/RANDSCONT.expected")
  [[ "$RESULT" == "$expected_output" ]]

}