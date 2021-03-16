test_that("use", {
  expect_silent(create_test_player())
  expect_silent(check_player(create_test_player()))
})
