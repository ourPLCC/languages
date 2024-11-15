#!/usr/bin/env bats

load '../../../../bin/relocate.bash'

@test "TYPE1 letrec" {
  relocate
  plccmk -c grammar > /dev/null
  RESULT="$(rep -n < ./tests/letrec/input)"

  expected_output=$(< "./tests/letrec/expected")
  [[ "$RESULT" == "$expected_output" ]]


}
