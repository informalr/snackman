#' Show the game state in a pretty way
#' @export
print_game_state <- function(game_state) {
  # TODO: check the game state

  # TODO: actually show the full game state
  cat(game_state$arena, sep = "\n")
  cat(game_state$player$x)
}
