test_that("test", {
  expect_silent(create_test_game_state())
  game_state <- create_test_game_state()
  expect_type(game_state, "list")
  expect_true("arena" %in% game_state)
  expect_true("player" %in% game_state)
})
