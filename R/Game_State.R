#' R6 Class representing a game state
#'
#' A game state has a player and an arena
Game_State <- R6::R6Class("Game_State", #nolint
  private = list(
    .player = NULL,
    .arena = NULL,
    check = function(player, arena) {
      if (!identical(class(player), c("Player", "R6"))) {
        stop("player must be of class Player")
      }
      if (!identical(class(arena), c("Arena", "R6"))) {
        stop("arena must be of class Arena")
      }
    }
  ),
  active = list(
    player = function(value) {
      if (missing(value)) {
        private$.player
      } else {
        stop("`$player`is read only", call. = FALSE)
      }
    },
    arena = function(value) {
      if (missing(value)) {
        private$.arena
      } else {
        stop("`$arena`is read only", call. = FALSE)
      }
    }
  ),
  public = list(
    #' @description
    #' Create a new game state object.
    #' @param player Player.
    #' @param arena Arena.
    #' @return A new `Game_State` object.
    initialize = function(player, arena) {
      private$check(player, arena)
      private$.player <- player
      private$.arena <- arena
    },
    print = function(...) {
      cat("Game State: \n")
      cat("================================================= \n")
      cat("    Player: \n")
      cat("      name:  ", private$.player$name, "\n", sep = "")
      cat("         x:  ", private$.player$x, "\n", sep = "")
      cat("         y:  ", private$.player$y, "\n", sep = "")
      cat("      size:  ", private$.player$size, "\n", sep = "")
      cat("================================================= \n")
      cat("     Arena: \n")
      cat("      text:  ", private$.arena$text, sep = "\n")
      cat("================================================= \n")
    }
  )
)
