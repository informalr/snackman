test_that("use", {
  expect_silent(testplayer <- create_test_player())
  expect_equal(testplayer$x, 1)
  expect_equal(testplayer$y, 1)
  expect_equal(testplayer$size, 1)
  expect_equal(testplayer$name, "Testplayer")
})
