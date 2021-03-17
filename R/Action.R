#' R6 Class representing an action
#'
#' An action has a type (right, left, up, down or no action).
Action <- R6::R6Class("Action", #nolint
  private = list(
    .type = NULL,
    check = function(type) {
      if (!type %in% c("right", "left", "up", "down", "no action")) {
        stop("'action' must be right, left, up, down or no action")
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
    #' @param type Type of action (right, left, up, down or no action).
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
