test_that("doing nothing results in the same game state", {
  skip("Issue 50. Issue #50")
  game_state <- create_test_game_state()
  new_game_state <- do_action(game_state, create_no_action())
  expect_true(are_game_states_identical(game_state, new_game_state))
})
