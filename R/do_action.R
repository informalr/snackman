#' Do action
#'
#' Apply action to player.
#'
#' @param game_state Game state.
#' @param action Action.
#' @return New game state.
#' @export
do_action <- function(game_state, action) {
  next_y <- switch(action$type,
                   "up"   = game_state$player$y - 1,
                   "down" = game_state$player$y + 1,
                   game_state$player$y)
  next_x <- switch(action$type,
                   "left"  = game_state$player$x - 1,
                   "right" = game_state$player$x + 1,
                   game_state$player$x)
  new_game_state <- game_state$clone()
  if (game_state$arena$layout[next_y, next_x] == 1 &&
      next_y %in% seq_len(nrow(game_state$arena$layout)) &&
      next_x %in% seq_len(ncol(game_state$arena$layout))) {
    new_game_state$player$y <- next_y
    new_game_state$player$x <- next_x
  }
  return(new_game_state)
}
