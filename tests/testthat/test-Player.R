test_that("use", {
  expect_silent(Player$new(1, 1, "chase"))
  expect_error(Player$new(-1, 1, "chase"), "x must be 1 or more")
  expect_error(Player$new(1, -1, "chase"), "y must be 1 or more")
  expect_error(Player$new(1, 1, ""),
               "name must be a character of length > 0")
})

test_that("things are private", {
  p <- Player$new(x = 1, y = 1, "Test player")
  expect_error(p$x <- 3) # private
  expect_error(p$y <- 3)
  expect_error(p$name <- "nonsense")
})

test_that("things are private", {
  x <- 314
  y <- 272
  personality <- "chase"
  g <- Ghost$new(x = x, y = y, personality = personality)
  expect_equal(x, g$get_x())
  expect_equal(y, g$get_y())
  expect_equal(personality, g$get_personality())
})
