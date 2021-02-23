library(R6)

Ghost <- R6Class( # nolint
  "Ghost",
  private = list(
    x = NA,
    y = NA,
    personality = NULL,
    check = function(...) {
      arguments <- as.list(match.call())[-1]
      lapply(seq_along(arguments), function(index, arguments, names) {
        arg_name <-  names[index]
        value <- arguments[[index]]
        if (arg_name == "x") {
          if (!is.numeric(value)) {
            stop("x must be a number")
          }
          if (value < 0) {
            stop("x must be 1 or more")
          }
          if (value %% 1 != 0) {
            stop("x must be an integer")
          }
        }
        if (arg_name == "y") {
          if (!is.numeric(value)) {
            stop("y must be a number")
          }
          if (value < 0) {
            stop("y must be 1 or more")
          }
          if (value %% 1 != 0) {
            stop("y must be an integer")
          }
        }
        if (arg_name == "personality") {
          if (!is.numeric(value)) {
            stop("personality must be a character string")
          }
          if (!value %in% c("chase", "ambush", "freak", "idiot")) {
            stop("personality must be chase, ambush, freak or idiot")
          }
        }
      }, arguments = arguments, names = names(arguments))
      invisible()
    }
  ),
  public = list(
    initialize = function(x = 1, y = 1, personality = "chase") {
      private$check(x = x, y = y, personality = personality)
      private$x <- x
      private$y <- y
      private$personality <- personality
    },
    get_x = function() {
      return(private$x)
    },
    get_y = function() {
      return(private$y)
    },
    get_personality = function() {
      return(private$personality)
    },
    set_x = function(x_new) {
      private$check(x = x_new)
      private$x <- x
      invisible()
    },
    set_y = function(y) {
      private$check_y(y)
      private$y <- y
      invisible()
    },
    print = function(...) {
      cat("      Ghost: \n")
      cat("          x:  ", private$x, "\n", sep = "")
      cat("          y:  ", private$y, "\n", sep = "")
      cat("personality:  ", private$y, "\n", sep = "")
    }
  )
)

