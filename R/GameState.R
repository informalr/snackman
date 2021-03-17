#' R6 Class representing a game state
#'
#' A game state has a player, list of ghosts and an arena.
GameState <- R6::R6Class("GameState", #nolint
  private = list(
    .player = NULL,
    .ghosts = NULL,
    .arena = NULL,
    check = function(player, ghosts, arena) {
      if (!identical(class(player), c("Player", "R6"))) {
        stop("player must be of class Player")
      }
      if (length(ghosts) != 0) {
        for (ghost in ghosts) {
          if (!identical(class(ghost), c("Ghost", "R6"))) {
            stop("ghost must be of class Ghost")
          }
        }
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
    ghosts = function(value) {
      if (missing(value)) {
        private$.ghosts
      } else {
        stop("`$ghosts`is read only", call. = FALSE)
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
    #' @param ghosts List of ghosts.
    #' @param arena Arena.
    #' @return A new `GameState` object.
    initialize = function(player, ghosts, arena) {
      private$check(player, ghosts, arena)
      private$.player <- player
      private$.ghosts <- ghosts
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
      cat("     Ghosts: \n")
      for (ghost in private$.ghosts) {
        cat("\n")
        cat("          x:", ghost$x, "\n", sep = "")
        cat("          y:", ghost$y, "\n", sep = "")
        cat("personality:", ghost$personality, "\n", sep = "")
      }
      cat("================================================= \n")
      cat("     Arena: \n")
      cat("    layout: \n")
      apply(private$.arena$layout, 1, function(x) {
        cat("           ", x, "\n", sep = "")
      })
      cat("================================================= \n")
    },
    do_action = function(action) {
      cat("Not implemented yet")
      invisible()
    }
  )
)
