test_that("use", {
  skip("WIP for Frans")
  expect_silent(Player$new(1, 1, "chase"))
  expect_error(Player$new(-1, 1, "chase"), "x must be 1 or more")
  expect_error(Player$new(1, -1, "chase"), "y must be 1 or more")
  expect_error(Player$new(1, 1, ""),
               "name must be a character of length > 0")
})

test_that("things are private", {
  skip("WIP for Frans")
  p <- Player$new(x = 1, y = 1, "Test player")
  expect_error(p$x <- 3) # private
  expect_error(p$y <- 3)
  expect_error(p$name <- "nonsense")
})

test_that("things are private", {
  skip("WIP for Frans")
  x <- 314
  y <- 272
  name <- "Snackman"
  g <- Player$new(x = x, y = y, name = name)
  expect_equal(x, g$get_x())
  expect_equal(y, g$get_y())
  expect_equal(name, g$get_name())
})

test_that("player has a size", {
  size <- 2
  p <- Player$new(x = 314, y = 217, name = "Snackman", size = 2)
  expect_equal(size, p$get_size())
})

test_that("player has a size of 1, 2 or 3", {
  expect_silent(Player$new(x = 314, y = 217, name = "Snackman", size = 1))
  expect_silent(Player$new(x = 314, y = 217, name = "Snackman", size = 2))
  expect_silent(Player$new(x = 314, y = 217, name = "Snackman", size = 3))
  expect_error(
    Player$new(x = 314, y = 217, name = "Snackman", size = 0),
    "size must be 1, 2 or 3"
  )
  expect_error(
    Player$new(x = 314, y = 217, name = "Snackman", size = 4),
    "size must be 1, 2 or 3"
  )
  expect_error(
    Player$new(x = 314, y = 217, name = "Snackman", size = "nonsense"),
    "size must be 1, 2 or 3"
  )
  expect_error(
    Player$new(x = 314, y = 217, name = "Snackman", size = NA),
    "size must be 1, 2 or 3"
  )
  expect_error(
    Player$new(x = 314, y = 217, name = "Snackman", size = NULL),
    "size must be 1, 2 or 3"
  )
})
