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

#' R6 Class representing a "go right" action
Right <- R6::R6Class("Right",  #nolint
  inherit = Action,
  public = list(
    #' @description
    #' Create a new go right object.
    #' @return A new `Right` object.
    initialize = function() {
      private$.type <- "right"
    }
  )
)

#' R6 Class representing a "go left" action
Left <- R6::R6Class("Left",  #nolint
  inherit = Action,
  public = list(
    #' @description
    #' Create a new go left object.
    #' @return A new `Left` object.
    initialize = function() {
      private$.type <- "left"
    }
  )
)

#' R6 Class representing a "go up" action
Up <- R6::R6Class("Up", #nolint
  inherit = Action,
  public = list(
    #' @description
    #' Create a new go up object.
    #' @return A new `Up` object.
    initialize = function() {
      private$.type <- "up"
    }
  )
)

#' R6 Class representing a "go down" action
Down <- R6::R6Class("Down",  #nolint
  inherit = Action,
  public = list(
    #' @description
    #' Create a new go down object.
    #' @return A new `Down` object.
    initialize = function() {
      private$.type <- "down"
    }
  )
)
