test_that("use", {
  player <- create_test_player()
  arena <- create_test_arena()
  expect_silent(moves <- train_ai_model(player, arena))
  expect_type(moves, "character")
})
