test_that("use", {
  skip("Issue 54. Issue #54")
  expect_equal(
    get_all_personalities(),
    c("chase", "ambush", "freak", "idiot")
  )
})
