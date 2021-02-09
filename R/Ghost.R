library(R6)

Ghost <- R6Class(
  "Ghost",
  private = list(
    x = NA
  ),
  public = list(
    y = NA,
    personality = NULL,
    initialize = function(x, y, personality) {
      # x and y must be 1 or more
      if (x < 0) {
        stop("x must be 1 or more")
      }
      if (y < 0) {
        stop("y must be 1 or more")
      }
      if (!personality %in% c('chase', 'ambush', 'freak', 'idiot')) {
        stop("personality must be chase, ambush, freak or idiot")
      }
      private$x <- x
      self$y <- y
      self$personality <- personality
    },
    print = function(){
      print("Ik ben een spookje")
    },

  )
  )
)

