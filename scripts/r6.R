library(testthat)

#' Empty is an empty class that always holds an even number
Empty <- R6::R6Class("Empty",
  #' Public part
  public = list(
    #' Constructor, always called initialize
    initialize = function() {
      # Nothing
    },
    #' Standard function name to print a class
    print = function() {
      message("I am empty")
    }
  )
)
empty <- Empty$new()
empty



#' Value is a class that always any value
Value <- R6::R6Class("Value",
  #' Public part
  public = list(
    #' Constructor, always called initialize
    initialize = function(value = NULL) {
      self$value <- value
    },
    #' Standard function name to print a class
    print = function() {
      message("I have value ", self$value)
    },
    value = NULL # Can be public, as any value is valid
  )
)
value <- Value$new("Hello")
expect_equal(value$value, "Hello")
value
value$value <- "Bye"
expect_equal(value$value, "Bye")
value

#' EvenNumber is a class that always holds an even number
EvenNumber <- R6::R6Class("EvenNumber",
  #' Public part
  public = list(
    #' Constructor, always called initialize
    initialize = function(value = 0) {
      self$set_value(value) # 'self' for public elements
    },
    #' Custom setter
    set_value = function(value) {
      if (value %% 2 == 0) {
        private$value <- value # 'private' for private elements
      } else {
        stop(value, " is not an even number")
      }
    },
    #' Custom getter
    get_value = function() {
      private$value
    },
    #' Standard function name to print a class
    print = function() {
      message("I am an even number with value ", private$value)
    }
  ),
  #' Private
  private = list(
    #' value will always be even
    value = 0
  )
)

# Use
library(testthat)
two <- EvenNumber$new(2)
two$print()
expect_equal(2, two$get_value())

expect_silent(EvenNumber$new(1234))
expect_error(
  EvenNumber$new(1),
  "1 is not an even number"
)
expect_error(
  two$set_value(3),
  "3 is not an even number"
)
expect_equal(2, two$get_value())

# No copy
two_again <- two # No copy!
two_again$set_value(4)
expect_equal(two_again$get_value(), 4)
expect_equal(two$get_value(), 4) # 'two' is also modified

# Shallow copy
two$set_value(2) # Fix
two_again <- two$clone()
expect_equal(two$get_value(), two_again$get_value())
two_again$set_value(6)
expect_equal(2, two$get_value())
expect_equal(6, two_again$get_value())

# Deep copy
two_again <- two$clone(deep = TRUE)
expect_equal(two$get_value(), two_again$get_value())
two_again$set_value(6)
expect_equal(2, two$get_value())
expect_equal(6, two_again$get_value())


#' A Beer class
Beer <- R6::R6Class("Beer",
  public = list(
    #' The constructor is called 'initialize'
    initialize = function(name = "Export", amount = 0.0) {
      private$name <- name
      private$amount <- amount
    },
    set_name = function(name) {
      private$name <- name
    },
    message = function() {
      message(paste0("I am ", private$amount, " liters of ", private$name, " beer"))
    }
  ),
  private = list(
    name = NULL,
    amount = NULL
  )
)
my_beer <- Beer$new("Export", 3.14)
my_beer$message()


