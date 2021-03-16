test_that("use", {
 arena <- create_test_arena()
 player <- create_test_player()
 expect_silent(create_game_state(arena, player))
 expect_silent(check_game_state(create_game_state(arena, player)))
})

test_that("misuse", {
})
