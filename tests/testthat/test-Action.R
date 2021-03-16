test_that("use", {
  expect_silent(Action$new("right"))
  expect_silent(Action$new("left"))
  expect_silent(Action$new("up"))
  expect_silent(Action$new("down"))
  expect_error(
    Action$new("nonsense"),
    "'action' must be right, left, up or down"
  )
})

test_that("things are private", {
  type <- "up"
  a <- Action$new(type = type)
  expect_error(a$type <- "down")
  expect_equal(type, a$type)
})

test_that("go right", {
  expect_silent(Right$new())
  expect_silent(Left$new())
  expect_silent(Up$new())
  expect_silent(Down$new())
  expect_equal(class(Right$new()), c("Right", "Action", "R6"))
  expect_equal(class(Left$new()), c("Left", "Action", "R6"))
  expect_equal(class(Up$new()), c("Up", "Action", "R6"))
  expect_equal(class(Down$new()), c("Down", "Action", "R6"))
})
