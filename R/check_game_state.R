#' Verify whether the game state is valid, and stop the game when it isn't.
check_game_state <- function(game_state) {
  if (is_game_state(game_state) == FALSE)
    stop("Invalid game state!")
}
