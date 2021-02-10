library(R6)

Ghost <- R6Class(
  "Ghost",
  private = list(
    x = NA,
    y = NA,
    personality = NULL
  ),
  public = list(
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
    print = function(){
      print("Ik ben een spookje")
    }
  )
)

