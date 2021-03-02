library(R6)

Player <- R6Class( # nolint
  "Player",

  private = list(
    .x = NA,
    y = NA,
    name = NA,
    size = NA
  ),

  public = list(
    initialize = function(x, y, name, size) {
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
      private$size <- size
    },
    get_x = function() {
      return(private$.x)
    },
    get_y = function() {
      return(private$y)
    },
    get_name = function() {
      return(private$name)
    },
    get_size = function() {
      return(private$size)
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
