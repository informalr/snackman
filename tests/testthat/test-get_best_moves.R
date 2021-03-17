test_that("use", {
  expect_silent(best_moves <- get_best_moves(4, 1, create_test_arena()))
  expect_type(best_moves, "character")
})
