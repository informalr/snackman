test_that("use", {
  game_state <- create_test_game_state()
  expect_output(print_game_state(game_state))
})
