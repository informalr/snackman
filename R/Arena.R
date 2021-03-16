#' R6 Class representing an arena
#'
#' An arena has a representation in text.
Arena <- R6::R6Class("Arena", #nolint
  private = list(
    .text = NULL,
    check = function(text) {
      if (!is.character(text)) {
        stop("text must be of character type")
      }
      if (length(text) < 3) {
        stop("arena must have at least 3 rows")
      }
      if (any(nchar(gsub("X|\\.", "", text)) != 0)) {
        stop("text must contain only `X` and `.`")
      }
      if (any(nchar(text) < 3)) {
        stop("Each row in the arena must have at least 3 characters")
      }
      if (length(unique(nchar(text))) != 1) {
        stop("Each row in the arena must have the same number of characters")
      }
    }
  ),
  active = list(
    text = function(value) {
      if (missing(value)) {
        private$.text
      } else {
        stop("`$text`is read only", call. = FALSE)
      }
    }
  ),
  public = list(
    #' @description
    #' Create a new arena object.
    #' @param text Character vector
    #' representing an arena.
    #' @return A new `Arena` object.
    initialize = function(text) {
      private$check(text)
      private$.text <- text
    },
    print = function(...) {
      cat("Arena: \n")
      cat(" text:  ", private$.text, "\n", sep = "\n")
    }
  )
)
