#' R6 Class representing a player
#'
#' A player has an x and y coordinate,
#' size and name.
Player <- R6::R6Class("Player", #nolint
  private = list(
    .x = NA,
    .y = NA,
    .size = NA,
    .name = NULL,
    .check_x = function(x) {
      if (x < 1) {
        stop("x must be 1 or more")
      }
    },
    .check_y = function(y) {
      if (y < 1) {
        stop("y must be 1 or more")
      }
    },
    .check_size = function(size) {
      if (is.null(size) || !is.numeric(size) || !size %in% c(1, 2, 3)) {
        stop("size must be 1, 2 or 3")
      }
    },
    .check_name = function(name) {
      if (is.null(name) || nchar(name) == 0) {
        stop("name must be a character of length > 0")
      }
    },
    .check = function(x, y, size, name) {
      private$.check_x(x)
      private$.check_y(y)
      private$.check_size(size)
      private$.check_name(name)
    }
  ),
  active = list(
    x = function(value) {
      if (missing(value)) {
        private$.x
      } else {
        private$.check_x(value)
        private$.x <- value
      }
    },
    y = function(value) {
      if (missing(value)) {
        private$.y
      } else {
        private$.check_y(value)
        private$.y <- value
      }
    },
    size = function(value) {
      if (missing(value)) {
        private$.size
      } else {
        private$.check_size(value)
        private$.size <- value
      }
    },
    name = function(value) {
      if (missing(value)) {
        private$.name
      } else {
        stop("`$name`is read only", call. = FALSE)
      }
    }
  ),
  public = list(
    #' @description
    #' Create a new player object.
    #' @param x x coordinate.
    #' @param y y coordinate.
    #' @param size Size (1, 2 or 3).
    #' @param name Name.
    #' @return A new `Player` object.
    initialize = function(x, y, size, name) {
      private$.check(x, y, size, name)
      private$.x <- x
      private$.y <- y
      private$.size <- size
      private$.name <- name
    },
    print = function(...) {
      cat("Player: \n")
      cat("     x:  ", private$.x, "\n", sep = "")
      cat("     y:  ", private$.y, "\n", sep = "")
      cat("  size:  ", private$.size, "\n", sep = "")
      cat("  name:  ", private$.name, "\n", sep = "")
    }
  )
)
