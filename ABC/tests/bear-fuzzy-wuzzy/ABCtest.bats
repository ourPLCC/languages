#!/usr/bin/env bats

setup() {
  cd "$(find / -type d -path '*/languages/ABC' -print -quit 2>/dev/null)"
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
  expected_output2=$(< "./tests/bear-fuzzy-wuzzy/ABC.expected2")
  [[ "$RESULT" == "$expected_output" || "$RESULT" == "$expected_output2" ]]
}
