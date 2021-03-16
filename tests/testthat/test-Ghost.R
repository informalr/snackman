test_that("use", {
  expect_silent(Ghost$new(1, 1, "chase"))
  expect_error(Ghost$new(-1, 1, "chase"), "x must be 1 or more")
  expect_error(Ghost$new(1, -1, "chase"), "y must be 1 or more")
  expect_error(Ghost$new(1, 1, "nonsense"),
               "personality must be chase, ambush, freak or idiot")
})

test_that("things are private", {
  g <- Ghost$new(1, 1, "chase")
  expect_error(g$x <- 3) # private
  expect_error(g$y <- 3)
  expect_error(g$personality <- "nonse")
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
