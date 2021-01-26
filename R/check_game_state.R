#' Verify whether the game state is valid, and stop the game when it isn't.
#'
#' @param game_state Game state.
#'
#'
#' @examples
#' arena <- create_arena()
#' player <- list()
#' player$x <- 100.0
#' player$y <- 200.0
#' player$size <- 1
#' game_state <- create_game_state(arena, player)
#' check_game_state(game_state)
check_game_state <- function(game_state) {
  if (is_game_state(game_state) == FALSE)
    stop("Invalid game state!")
}
