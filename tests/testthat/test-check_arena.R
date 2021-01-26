test_that("use", {
  expect_silent(
    check_arena(
      c(
        "XXX",
        "X.X",
        "XXX"
      )
    )
  )

  expect_error(
    check_arena("X"),
    "'arena' must have at least 3 rows"
  )
  expect_error(
    check_arena(c("X", "X", "X")),
    "Each row in the arena must have at least 3 characters"
  )
  expect_error(
    check_arena(arena_text = c("XXX", "X.........X", "XXX")),
    "Each row in the arena must have the same number of characters"
  )
  expect_error(
    check_arena(NA),
    "'arena' must be of character type"
  )
  expect_error(
    check_arena(NULL),
    "'arena' must be of character type"
  )
})
