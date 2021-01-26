
test_that("use", {
  # arena <- c(
  #   "XXXXX",
  #   "X...X",
  #   "X..XX",
  #   "X...X",
  #   "XXXXX"
  # )
  #
  # player <- list()
  # player$x <- 100.0
  # player$y <- 200.0
  # player$size <- 1
  #
  expect_silent(check_game_state(create_test_game_state()))
  expect_error(
    check_game_state(
      list(arena = "nonsense", player = create_test_player())) ,
      "Invalid 'arena'"
    )
  expect_error(
    check_game_state(
      list(arena = create_test_arena(), player = "nonsense")) ,
      "Invalid 'player'"
    )
})
