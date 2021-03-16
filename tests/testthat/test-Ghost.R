test_that("use", {
  expect_silent(Ghost$new(1, 1, "chase"))
  expect_error(Ghost$new(-1, 1, "chase"), "x must be 1 or more")
  expect_error(Ghost$new(1, -1, "chase"), "y must be 1 or more")
  expect_error(Ghost$new(1, 1, "nonsense"),
               "personality must be chase, ambush, freak or idiot")
})

test_that("things are private", {
  x <- 314
  y <- 272
  personality <- "chase"
  g <- Ghost$new(x = x, y = y, personality = personality)
  expect_error(g$x <- 1)
  expect_error(g$y <- 1)
  expect_error(g$personality <- "idiot")
  expect_equal(x, g$x)
  expect_equal(y, g$y)
  expect_equal(personality, g$personality)
})
