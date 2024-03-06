#!/usr/bin/env bats

setup() {
  cd ABC
  plcc grammar
  javac -cp abcdatalog.jar Java/*.java
}

teardown() {
  rm -rf "./Java"
  cd ..
}

@test "ABC bear-fuzzy-wuzzy" {
  RESULT="$(java -cp abcdatalog.jar:Java Rep -n < ./tests/bear-fuzzy-wuzzy/ABC.input)"
  expected_output=$(< "./tests/bear-fuzzy-wuzzy/ABC.expected")
  [[ "$RESULT" == "$expected_output" ]]
}
