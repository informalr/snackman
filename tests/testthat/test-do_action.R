test_that("doing nothing results in the same game state", {
  game_state <- create_test_game_state()
  new_game_state <- do_action(game_state, create_no_action())
  expect_true(are_identical_game_states(game_state, new_game_state))
})
