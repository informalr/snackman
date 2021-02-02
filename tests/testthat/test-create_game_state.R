test_that("use", {
 arena <- create_test_arena()
 player <- create_test_player()
 expect_silent(create_game_state(arena, player))
 expect_silent(check_game_state(create_game_state(arena, player)))
})

test_that("misuse", {
  expect_error(create_game_state(NULL, player),
               "The first argument must be a character vector.")
  expect_error(create_game_state(NA, player),
               "The first argument must be a character vector.")
  expect_error(create_game_state(arena, NULL),
               "The second argument must be a list.")
  expect_error(create_game_state(arena, NA),
               "The second argument must be a list.")
})
