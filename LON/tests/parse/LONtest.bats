#!/usr/bin/env bats

setup() {
  cd "$(git rev-parse --show-toplevel)"
  cd LON
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