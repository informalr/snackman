test_that("use", {
  skip("Issue 51. Issue #51")
  a <- create_test_game_state()
  b <- create_test_game_state()
  expect_true(are_game_states_identical(a, b))
})
