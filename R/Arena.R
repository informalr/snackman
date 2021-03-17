#' R6 Class representing an arena
#'
#' An arena has a layout.
Arena <- R6::R6Class("Arena", #nolint
  private = list(
    .layout = NULL,
    check = function(layout) {
      if (is.null(layout)) {
        stop("'layout' must not be NULL")
      }
      if (!is.data.frame(layout)) {
        stop("'layout' must be a data frame")
      }
      if (nrow(layout) < 3) {
        stop("'layout' must have at least 3 rows")
      }
      if (ncol(layout) < 3) {
        stop("'layout' must have at least 3 columns")
      }
      if (any(!complete.cases(layout))) {
        stop("'layout' must not contain NA's")
      }
      if (any(sapply(layout, function(x) !x %in% c(0, 1)))) {
        stop("'layout' must contain only 1 and 0")
      }
    }
  ),
  active = list(
    layout = function(value) {
      if (missing(value)) {
        private$.layout
      } else {
        stop("'layout' is read only", call. = FALSE)
      }
    }
  ),
  public = list(
    #' @description
    #' Create a new arena object.
    #' @param layout Dataframe with the layout of the arena.
    #' @return A new `Arena` object.
    initialize = function(layout) {
      private$check(layout)
      private$.layout <- layout
    },
    print = function(...) {
      cat(" Arena: \n")
      cat("layout: \n")
      apply(private$.layout, 1, function(x) {
        cat("         ", x, "\n", sep = "")
      })
    }
  )
)
