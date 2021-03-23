test_that("use", {
  player <- create_test_player()
  arena <- create_test_arena()
  expect_silent(model <- train_ai_model(player, arena))
  expect_type(model, "list")
  expect_s3_class(model, "rl")
})
