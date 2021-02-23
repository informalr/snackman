#' This function does nothing. It is intended to inherit is parameters'
#' documentation.
#' @param action a list representing an action,
#' as created by \link{create_action}
#' @param game_state a game state,
#'   as created by \link{create_game_state}
#' @param verbose set to TRUE for more output
#' @note This is an internal function, so it should be marked with
#'   \code{@noRd}. This is not done, as this will disallow all
#'   functions to find the documentation parameters
default_params_doc <- function(
  action,
  game_state,
  verbose
) {
  # Nothing
}
