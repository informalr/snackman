#' Show the game state in a pretty way
#' @param game_state a game state, as created by create_game_state
#' @export
print_game_state <- function(game_state) {
  # TODO: check the game state

  # TODO: actually show the full game state
  cat(game_state$arena, sep = "\n")
  cat(game_state$player$x)
}
