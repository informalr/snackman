test_that("use", {
  expect_silent(Ghost$new(1, 1, "chase"))
  expect_error(Ghost$new(-1, 1, "chase"), "x must be 1 or more")
  expect_error(Ghost$new(1, -1, "chase"), "y must be 1 or more")
  expect_error(Ghost$new(1, 1, "nonsense"),
               "personality must be chase, ambush, freak or idiot")
})
