#' R6 Class representing an action
#'
#' A action has a type (right, left, up or down).
Action <- R6::R6Class("Action", #nolint
  private = list(
    .type = NULL,
    check = function(type) {
      if (!type %in% c("right", "left", "up", "down")) {
        stop("'action' must be right, left, up or down")
      }
    }
  ),
  active = list(
    type = function(value) {
      if (missing(value)) {
        private$.type
      } else {
        stop("`$type`is read only", call. = FALSE)
      }
    }
  ),
  public = list(
    #' @description
    #' Create a new action object.
    #' @param type Type of action.
    #' @return A new `Action` object.
    initialize = function(type) {
      private$check(type)
      private$.type <- type
    },
    print = function(...) {
      cat("Action: \n")
      cat("  type:  ", private$.type, "\n", sep = "")
    }
  )
)
