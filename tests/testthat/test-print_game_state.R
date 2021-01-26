test_that("use", {
  # TODO: create the game_state in a one-liner
  arena <- create_arena()
  player <- list()
  player$x <- 100.0
  player$y <- 200.0
  player$size <- 1
  game_state <- create_game_state(arena, player)
  expect_output(print_game_state(game_state))
})
