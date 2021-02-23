library(R6)

Player <- R6Class( # nolint
  "Player",

  private = list(
    .x = NA,
    y = NA,
    name = NA
  ),

  public = list(
    initialize = function(x, y, name) {
      if (x < 1) {
        stop("x must be 1 or more")
      }
      if (y < 1) {
        stop("y must be 1 or more")
      }
      if (is.null(name) | nchar(name) == 0) {
        stop("name must be a character of length > 0")
      }
      private$.x <- x
      private$y <- y
      private$name <- name
    },

    print = function(...) {
      cat("     Player: \n")
      cat("       name:  ", private$name, "\n", sep = "")
      cat("          x:  ", private$.x,    "\n", sep = "")
      cat("          y:  ", private$y,    "\n", sep = "")

    },
    active = list(
      x = function(value) {
        if (missing(value)) {
          private$.x
        } else {
          stop("`$x` is read only", call. = FALSE)
        }
      }
    )
  )
)
