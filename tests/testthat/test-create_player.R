test_that("use", {
  expect_silent(create_player())
  expect_silent(check_player(create_player()))
})
