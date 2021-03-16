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
})
