test_that("use", {
  expect_silent(
    game_state <- GameState$new(
      player = create_test_player(),
      ghosts = create_test_ghosts(),
      arena = create_test_arena()
    )
  )
  expect_output(print(game_state, verbose = FALSE))
  expect_output(print(game_state, verbose = TRUE))
  expect_error(
    GameState$new(
      player = "nonsense",
      ghosts = create_test_ghosts(),
      arena  = create_test_arena()
    ),
    "player must be of class Player"
  )
  expect_error(
    GameState$new(
      player = create_test_player(),
      ghosts = list("nonsense"),
      arena  = create_test_arena()
    ),
    "ghost must be of class Ghost"
  )
  expect_error(
    GameState$new(
      player = create_test_player(),
      ghosts = create_test_ghosts(),
      arena = "nonsense"
    ),
    "arena must be of class Arena"
  )
})

test_that("things are private", {
  player <- create_test_player()
  ghosts <- create_test_ghosts()
  arena  <- create_test_arena()
  game_state <- GameState$new(player = player, ghosts = ghosts, arena = arena)
  expect_error(game_state$player <- Player$new(1, 1, "nonsense"))
  expect_silent(game_state$player <- Player$new(1, 1, 1, player$name))
  expect_error(game_state$ghosts <- create_test_ghosts())
  expect_error(game_state$arena  <- create_test_arena())
  expect_equal(player, game_state$player)
  expect_equal(ghosts, game_state$ghosts)
  expect_equal(arena,  game_state$arena)
})
