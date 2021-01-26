#' Determine whether an object is a valid game state.
#'
#' @param game_state Game state.
#'
#' @return logical with value `TRUE` for a valid and `FALSE` for an invalid game state.
#'
#' @examples
#' arena <- create_arena()
#' player <- list()
#' player$x <- 100.0
#' player$y <- 200.0
#' player$size <- 1
#' game_state <- create_game_state()
#' is_game_state(game_state)
is_game_state <- function(game_state) {
  return(
    (is.list(game_state)) &
    (is.character(game_state$arena)) &
    (is.list(game_state$player))
  )
}
