test_that("use", {
  arena <- c(
    "XXXXX",
    "X...X",
    "X..XX",
    "X...X",
    "XXXXX"
  )

  player <- list()
  player$x <- 100.0
  player$y <- 200.0
  player$size <- 1

  expect_error(check_game_state(list(arena = NULL, player = NULL)) , "Invalid game state!")
  expect_silent(check_game_state(list(arena = arena, player = player)))
})
