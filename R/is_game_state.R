#' Check if an object is a valid game state.
#'
#' @param game_state Game state.
#'
#' @return logical, `TRUE` for a valid and `FALSE` for an invalid game state.
is_game_state <- function(game_state) {
  identical(class(game_state), c("GameState", "R6"))
}
