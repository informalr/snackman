#' Predict best move for ghosts
#'
#' This function predicts the best moves for the ghosts in a game.
#'
#' @param game_state Game state.
#'
#' @return Character vector containing the best move for each ghost in the game.
#' @export
predict_best_move <- function(game_state) {
  # The model was trained on a game state with the player on position
  # (x = 2, y = 1) and for the test arena.
  # So the applicability of the model is limited!

  test_player <- create_test_player()
  test_arena <- create_test_arena()

  if (game_state$player$x != test_player$x ||
      game_state$player$y != test_player$y ||
      !identical(game_state$arena$layout, test_arena$layout)) {
    stop("The model cannot make predictions for this game state.")
  } else {
    sapply(game_state$ghosts, function(ghost) {
      # The next line will generate a note when the code is checked.
      # The predict (not predict.rl) function should work, but generates an
      # error. Hence the workaround. An alternative would be to explicitly load
      # the ReinforcementLearning package using a library statement.
      ReinforcementLearning:::predict.rl(
        snackman::model,
        paste(ghost$y, ghost$x)
      )
    })
  }
}
