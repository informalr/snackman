test_that("use", {
  expect_true(is_game_state(create_test_game_state()))
  expect_false(is_game_state(create_test_player()))
})
