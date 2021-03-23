test_that("use", {
  expect_silent(moves <- predict_best_move(create_test_game_state()))
  expect_true(class(moves) == "character")
  test_arena <- data.frame(
    V1 = c(0, 0, 0, 0, 0, 0),
    V2 = c(1, 1, 1, 1, 0, 0),
    V3 = c(0, 0, 1, 1, 1, 1)
  )
  game_state <- GameState$new(
    player = create_test_player(),
    ghosts = create_test_ghosts(),
    arena = Arena$new(test_arena))
  expect_error(
    predict_best_move(game_state),
    "The model cannot make predictions for this game state."
  )
})
