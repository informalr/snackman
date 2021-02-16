test_that("test", {
  expect_silent(create_test_game_state())
  game_state <- create_test_game_state()
  expect_type(game_state, "list")
  expect_true("arena" %in% names(game_state))
  expect_true("player" %in% names(game_state))
  expect_silent(check_game_state(create_test_game_state()))
})
