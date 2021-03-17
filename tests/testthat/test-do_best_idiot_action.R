test_that("an idiotic action must do something", {
  skip("Issue 55. Issue #55")
  game_state <- create_test_game_state()
  action <- do_best_idiot_action(game_state)
  new_game_state <- do_action(game_state, action)
  expect_false(are_game_states_identical(game_state, new_game_state))
})
