test_that("use", {
  player <- create_test_player()
  arena <- create_test_arena()
  expect_silent(moves <- get_best_moves(player, arena))
  expect_type(moves, "character")
})
