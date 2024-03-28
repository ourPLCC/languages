#!/usr/bin/env bats

setup() {
  cd "$(find / -type d -path '*/languages/LON' -print -quit 2>/dev/null)"
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