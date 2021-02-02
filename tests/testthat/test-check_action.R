test_that("use", {
  expect_error(check_action("banana"),
                "'action' must be a list")
  expect_error(check_action(list))
                "'action' must be left, right, up or down")
})
