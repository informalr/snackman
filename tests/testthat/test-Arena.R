test_that("use", {
  expect_silent(
    arena <- Arena$new(
      matrix(c(1, 1, 1, 0, 1, 0, 1, 1, 1), nrow = 3)
    )
  )
  expect_equal(arena$condensed_layout, "111010111")
  expect_error(
    Arena$new(NULL),
    "'layout' must not be NULL"
  )
  expect_error(
    Arena$new("nonsense"),
    "'layout' must be a matrix"
  )
  expect_error(
    Arena$new(
      matrix(c(1, 1, 1, 0), nrow = 2)
    ),
    "'layout' must have at least 3 rows"
  )
  expect_error(
    Arena$new(
      matrix(c(1, 1, NA, 0, 1, 0, 1, NA, 1), nrow = 3)
    ),
    "'layout' must not contain NA's"
  )
  expect_error(
    Arena$new(
      matrix(c(1, 1, 1, 0, ".", 0, "X", 1, 1), nrow = 3)
    ),
    "'layout' must contain only 1 and 0"
  )
  expect_error(
    Arena$new(
      matrix(c(1, 1, 1, 0, 1, 0, 1, 1, 1, 1), nrow = 5)
    ),
    "'layout' must have at least 3 columns"
  )
})

test_that("things are private", {
  arena <- Arena$new(
    matrix(c(1, 1, 1, 0, 1, 0, 1, 1, 1), nrow = 3)
  )
  expect_error(
    arena$layout <- matrix(c(0, 0, 0, 1, 0, 1, 0, 0, 0), nrow = 3)
  )
})
