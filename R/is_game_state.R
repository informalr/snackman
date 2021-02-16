#' Check if an object is a valid game state.
#'
#' @param game_state Game state.
#'
#' @return logical, `TRUE` for a valid and `FALSE` for an invalid game state.
is_game_state <- function(game_state) {
  is_valid <- FALSE
  tryCatch({
    snackman::check_game_state(game_state)
    is_valid <- TRUE
  }, error = function(e) {} # nolint no worries
  )
  is_valid
}
