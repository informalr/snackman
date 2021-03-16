#' R6 Class representing a ghost
#'
#' A ghost has an x and y coordinate,
#' and a personality (chase, ambush,
#' freak or idiot).
Ghost <- R6::R6Class("Ghost", #nolint
  private = list(
    .x = NA,
    .y = NA,
    .personality = NULL,
    check = function(x, y, personality) {
      if (x < 0) {
        stop("x must be 1 or more")
      }
      if (y < 0) {
        stop("y must be 1 or more")
      }
      if (!personality %in% c("chase", "ambush", "freak", "idiot")) {
        stop("personality must be chase, ambush, freak or idiot")
      }
    }
  ),
  active = list(
    x = function(value) {
      if (missing(value)) {
        private$.x
      } else {
        stop("`$x`is read only", call. = FALSE)
      }
    },
    y = function(value) {
      if (missing(value)) {
        private$.y
      } else {
        stop("`$y`is read only", call. = FALSE)
      }
    },
    personality = function(value) {
      if (missing(value)) {
        private$.personality
      } else {
        stop("`$personality`is read only", call. = FALSE)
      }
    }
  ),
  public = list(
    #' @description
    #' Create a new ghost object.
    #' @param x x coordinate.
    #' @param y y coordinate.
    #' @param personality Personality (chase, ambush,
    #' freak or idiot).
    #' @return A new `Ghost` object.
    initialize = function(x, y, personality) {
      private$check(x, y, personality)
      private$.x <- x
      private$.y <- y
      private$.personality <- personality
    },
    print = function(...) {
      cat("      Ghost: \n")
      cat("          x:  ", private$.x, "\n", sep = "")
      cat("          y:  ", private$.y, "\n", sep = "")
      cat("personality:  ", private$.personality, "\n", sep = "")
    }
  )
)
