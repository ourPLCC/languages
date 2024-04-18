function relocate () {
  cd "${BATS_TEST_TMPDIR}"
  cp -R "${BATS_TEST_DIRNAME}/../../"* .
}