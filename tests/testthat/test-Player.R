test_that("use", {
  expect_error(
    Player$new(x = -1, y = 217, size = 1, name = "Snackman"),
    "x must be 1 or more"
  )
  expect_error(
    Player$new(x = 314, y = -1, size = 1, name = "Snackman"),
    "y must be 1 or more"
  )
  expect_error(
    Player$new(x = 314, y = 217, size = 0, name = "Snackman"),
    "size must be 1, 2 or 3"
  )
  expect_silent(
    Player$new(x = 314, y = 217, size = 1, name = "Snackman")
  )
  expect_silent(
    Player$new(x = 314, y = 217, size = 2, name = "Snackman")
  )
  expect_silent(
    Player$new(x = 314, y = 217, size = 3, name = "Snackman")
  )
  expect_error(
    Player$new(x = 314, y = 217, size = 4, name = "Snackman"),
    "size must be 1, 2 or 3"
  )
  expect_error(
    Player$new(x = 314, y = 217, size = "nonsense", name = "Snackman"),
    "size must be 1, 2 or 3"
  )
  expect_error(
    Player$new(x = 314, y = 217, size = NA, name = "Snackman"),
    "size must be 1, 2 or 3"
  )
  expect_error(
    Player$new(x = 314, y = 217, size = NULL, name = "Snackman"),
    "size must be 1, 2 or 3"
  )
  expect_error(
    Player$new(x = 1, y = 1, size = 1, name = ""),
    "name must be a character of length > 0")
  expect_error(
    Player$new(x = 1, y = 1, size = 1, name = NULL),
    "name must be a character of length > 0")
})

test_that("things are public or private", {
  x <- 314
  y <- 272
  size <- 3
  name <- "Jack"
  player <- Player$new(x = x, y = y, size = size, name = name)
  expect_silent(player$x <- 1)
  expect_silent(player$y <- 1)
  expect_silent(player$size <- 1)
  expect_error(player$name <- "Pacman")
  expect_equal(player$x, 1)
  expect_equal(player$y, 1)
  expect_equal(player$size, 1)
  expect_equal(player$name, name)
})
