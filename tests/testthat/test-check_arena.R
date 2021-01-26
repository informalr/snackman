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
    check_arena(c("XXX", "XXXX", "XXX")),
    "Each row in the arena must have at least 3 characters"
  )
})
