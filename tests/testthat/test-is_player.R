test_that("use", {
  expect_true(is_player(create_test_player()))
  expect_false(is_player(create_test_game_state()))
})
