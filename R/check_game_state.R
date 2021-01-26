#' Verify whether the game state is valid, and stop the game when it isn't.
#' @export
check_game_state <- function(game_state) {
  if (!is.list(game_state)) {
    stop("'game_state' must be a list")
  }
  if (!"arena" %in% names(game_state)) {
    stop("'game_state' must have an element called 'arena'")
  }
  if (!"player" %in% names(game_state)) {
    stop("'game_state' must have an element called 'player'")
  }

  snackman::check_arena(game_state$arena)
  snackman::check_player(game_state$player)
}
