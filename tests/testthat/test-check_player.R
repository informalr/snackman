test_that("use", {
  expect_silent(check_player(create_test_player()))
  expect_error(
    check_player(NA),
    "'player' must be a list"
  )
  expect_error(
    check_player(list()),
    "'player' must be a list with the element 'x'"
  )
})
