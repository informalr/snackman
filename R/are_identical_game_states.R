#' Are identical game state
#'
#' This function determines whether two game states are identical.
#'
#' @param game_state_1 First game state.
#' @param game_state_2 Second game state.
#'
#' @return Logical indicating whether game states are identical (`TRUE` or
#' `FALSE`).
#' @export
are_identical_game_states <- function(game_state_1, game_state_2) {
  return(
    are_identical_players(game_state_1$player, game_state_2$player) &&
    are_identical_ghosts(game_state_1$ghosts, game_state_2$ghosts) &&
    are_identical_arenas(game_state_1$arena, game_state_2$arena)
  )
}

#' Are identical players.
#'
#' This function determines whether two players are identical.
#'
#' @param player_1 First player.
#' @param player_2 Second player.
#'
#' @return Logical indicating whether players are identical (`TRUE` or `FALSE`).
#' @export
are_identical_players <- function(player_1, player_2) {
  return(
    all(
      player_1$x == player_2$x &&
      player_1$y == player_2$y &&
      player_1$size == player_2$size &&
      player_1$name == player_2$name
    )
  )
}

#' Are identical lists of ghosts
#'
#' This function determines whether two lists of ghosts are identical.
#'
#' @param ghosts_1 First list with ghosts.
#' @param ghosts_2 Second list with ghosts.
#'
#' @return Logical indicating whether lists of ghosts are identical (`TRUE` or
#' `FALSE`)
#' @export

are_identical_ghosts <- function(ghosts_1, ghosts_2) {
  if (length(ghosts_1) != length(ghosts_2)) {
    return(FALSE)
  } else {
    for (i in seq_along(ghosts_1)) {
      if (ghosts_1[[i]]$x != ghosts_2[[i]]$x ||
          ghosts_1[[i]]$y != ghosts_2[[i]]$y ||
          ghosts_1[[i]]$personality != ghosts_2[[i]]$personality) {
        return(FALSE)
      }
    }
    return(TRUE)
  }
}

#' Are identical arena's
#'
#' This function determines whether two arena's are identical.
#'
#' @param arena_1 First arena.
#' @param arena_2 Second arena.
#'
#' @return Logical indicating whether arena's are identical (`TRUE` ir `FALSE`).
#' @export
are_identical_arenas <- function(arena_1, arena_2) {
  return(identical(arena_1$layout, arena_2$layout))
}
