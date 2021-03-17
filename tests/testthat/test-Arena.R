test_that("use", {
  expect_silent(
    Arena$new(
      data.frame(
        V1 = c(1, 0, 1),
        V2 = c(1, 1, 1),
        V3 = c(1, 0, 1)
      )
    )
  )
  expect_error(
    Arena$new(NULL),
    "'layout' must not be NULL"
  )
  expect_error(
    Arena$new("nonsense"),
    "'layout' must be a data frame"
  )
  expect_error(
    Arena$new(data.frame(V1 = NULL, V2 = NULL, V3 = NULL)),
    "'layout' must have at least 3 rows"
  )
  expect_error(
    Arena$new(data.frame(V1 = c(1, 0), V2 = c(0, 1), V3 = c(1, 0))),
    "'layout' must have at least 3 rows"
  )
  expect_error(
    Arena$new(
      data.frame(
        V1 = c(1, 0, 1),
        V2 = c(1, NA, 1),
        V3 = c(1, 0, 1)
      )
    ),
    "'layout' must not contain NA's"
  )
  expect_error(
    Arena$new(
      data.frame(
        V1 = c(1, 0, 1),
        V2 = c(1, 0, 1),
        V3 = c("X", ".", "X")
      )
    ),
    "'layout' must contain only 1 and 0"
  )
  expect_error(
    Arena$new(
      data.frame(
        V1 = c(1, 0, 1),
        V2 = c(1, 0, 1)
      )
    ),
    "'layout' must have at least 3 columns"
  )
})

test_that("things are private", {
  layout <- data.frame(
    V1 = c(1, 0, 1),
    V2 = c(1, 1, 1),
    V3 = c(1, 0, 1)
  )
  arena <- Arena$new(layout)
  expect_error(arena$layout <- data.frame(
      V1 = c(0, 1, 0),
      V2 = c(0, 0, 0),
      V3 = c(0, 1, 0)
    )
  )
  expect_equal(layout, arena$layout)
})
