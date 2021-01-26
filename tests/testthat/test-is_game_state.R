test_that("multiplication works", {
  expect_error(create_game_state(NULL, player),
               "The first argument must be a character vector.")
  expect_error(create_game_state(NA, player),
               "The first argument must be a character vector.")
  expect_error(create_game_state(arena, NULL),
               "The second argument must be a list.")
  expect_error(create_game_state(arena, NA),
               "The second argument must be a list.")
})
