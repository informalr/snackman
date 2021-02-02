test_that("use", {
  action <- list(type = "left")
  expect_silent(check_action(action))
})

test_that("misuse", {
  action <- "not a list"
  expect_error(check_action(action),
               "'action' must be a list")
  action <- list(type = "banana")
  expect_error(check_action(action),
              "'action' must be left, right, up or down")
})
