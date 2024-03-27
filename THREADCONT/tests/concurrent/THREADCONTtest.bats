#!/usr/bin/env bats

setup() {
  cd "$(git rev-parse --show-toplevel)"
  cd THREADCONT
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