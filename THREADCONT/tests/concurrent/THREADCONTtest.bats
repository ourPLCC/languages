#!/usr/bin/env bats

setup() {
  cd "$(find / -type d -path '*/languages/THREADCONT' -print -quit 2>/dev/null)"
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