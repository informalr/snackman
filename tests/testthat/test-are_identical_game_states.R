test_that("use", {
  a <- create_test_game_state()
  b <- create_test_game_state()
  expect_true(are_identical_game_states(a, b))
})
