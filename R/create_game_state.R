#' Create a game state.
#'
#' @param arena An arena.
#' @param player A player.
#'
#' @return A game state.
#' @export
create_game_state <- function(arena, player) {
  snackman::check_arena(arena)
  snackman::check_player(player)
  game_state <- list()
  game_state$arena <- arena
  gamestate$player <- player
  return(game_state)
}
