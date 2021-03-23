#' R6 Class representing a game state
#'
#' A game state has a player, list of ghosts and an arena.
GameState <- R6::R6Class("GameState", #nolint
  private = list(
    .player = NULL,
    .ghosts = NULL,
    .arena = NULL,
    .check = function(player, ghosts, arena) {
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
    },
    .state = function() {
      m <- private$.arena$layout
      m[private$.player$y, private$.player$x] <- "P"
      sapply(private$.ghosts, function(ghost) m[ghost$y, ghost$x] <<- "G")
      m
    },
    .condensed_state = function() {
      paste(private$.state(), collapse = "")
    }
  ),
  active = list(
    player = function(value) {
      if (missing(value)) {
        private$.player
      } else if (is_player(value)) {
        if (private$.player$name != value$name) {
          stop("'name' is read only")
        } else {
          private$.player$x <- value$x
          private$.player$y <- value$y
          private$.player$size <- value$size
        }
      } else {
        stop("Input must be of type Player")
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
    },
    condensed_state = function() {
      private$.condensed_state()
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
      private$.check(player, ghosts, arena)
      private$.player <- player
      private$.ghosts <- ghosts
      private$.arena <- arena
    },
    print = function(verbose = FALSE, ...) {
      cat("Game State: \n")
      cat("=================================================")
      prmatrix(
        private$.state(),
        rowlab = rep("", nrow(private$.arena$layout)),
        collab = rep("", ncol(private$.arena$layout)),
        quote = FALSE
      )
      cat("================================================= \n")
      if (verbose) {
        print(private$.player)
        cat("================================================= \n")
        for (ghost in private$.ghosts) {
          print(ghost)
        }
        cat("================================================= \n")
        print(private$.arena)
        cat("================================================= \n")
      }
    },
    do_action = function(action) {
      cat("Not implemented yet")
      invisible()
    }
  )
)
