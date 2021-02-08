test_that("use", {
  arena <- create_test_arena()
  player <- create_test_player()
  expect_true(is_game_state(list(arena = arena, player = player)))
  expect_false(is_game_state(list(arena = NULL, player = NULL)))
  expect_false(is_game_state(list(arena = arena, player = NULL)))
})
