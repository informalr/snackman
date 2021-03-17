test_that("use", {
  expect_silent(
    Arena$new(
      c(
        "XXXXX",
        "X...X",
        "X.XXX",
        "X...X",
        "XXXXX"
      )
    )
  )
  expect_error(
    Arena$new(NULL),
    "text must be of character type"
  )
  expect_error(
    Arena$new(character(0)),
    "arena must have at least 3 rows"
  )
  expect_error(
    Arena$new(
      c(
        "XXXXX",
        "X...X"
      )
    ),
    "arena must have at least 3 rows"
  )
  expect_error(
    Arena$new(
      c(
        "XXYXX",
        "X...X",
        "X.XXX",
        "X._.X",
        "XXXXX"
      )
    ),
    "text must contain only `X` and `.`"
  )
  expect_error(
    Arena$new(
      c(
        "XX",
        "X...X",
        "X.XXX",
        "X.X.X",
        "XXXXX"
      )
    ),
    "Each row in the arena must have at least 3 characters"
  )
  expect_error(
    Arena$new(
      c(
        "XXX",
        "X...X",
        "X.XXX",
        "X.X.X",
        "XXXXX"
      )
    ),
    "Each row in the arena must have the same number of characters"
  )
})

test_that("things are private", {
  text <- c(
    "XXXXX",
    "X...X",
    "X.XXX",
    "X...X",
    "XXXXX"
  )
  a <- Arena$new(text)
  expect_error(a$text <- "XXX.XXX")
  expect_equal(text, a$text)
})
