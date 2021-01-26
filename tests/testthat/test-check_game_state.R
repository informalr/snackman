
test_that("use", {
  expect_silent(check_game_state(create_test_game_state()))
  expect_error(
    check_game_state("nonsense"),
    "'game_state' must be a list"
  )
  expect_error(
    check_game_state(list()),
    "'game_state' must have an element called 'arena'"
  )
  expect_error(
    check_game_state(list(arena = create_test_arena())),
    "'game_state' must have an element called 'player'"
  )
  expect_error(
    check_game_state(
      list(arena = "nonsense", player = create_test_player())
    )
  )
  expect_error(
    check_game_state(
      list(arena = create_test_arena(), player = "nonsense")
    )
  )
})
