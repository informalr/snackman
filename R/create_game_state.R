#' Create a game state.
#'
#' @param a An arena.
#' @param p A player.
#'
#' @return A game state.
#' @export
#'
#' @examples
#' arena <- create_arena()
#' player <- list()
#' player$x <- 100.0
#' player$y <- 200.0
#' player$size <- 1
#' game_state <- create_game_state(arena, player)
create_game_state <- function(a, p) {
  if (!is.character(a)) stop("The first argument must be a character vector.")
  if (!is.list(p)) stop("The second argument must be a list.")
  l <- list()
  l$arena <- a
  l$player <- p
  return(l)
}
