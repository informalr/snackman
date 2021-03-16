test_that("use", {
  expect_silent(
    gs <- Game_State$new(
      player = create_test_player(),
      arena = create_test_arena()
    )
  )
  expect_error(
    Game_State$new(
      player = "nonsense",
      arena = create_test_arena()
    ),
    "player must be of class Player"
  )
  expect_error(
    Game_State$new(
      player = create_test_player(),
      arena = "nonsense"
    ),
    "arena must be of class Arena"
  )
})

test_that("things are private", {
  p <- create_test_player()
  a <- create_test_arena()
  gs <- Game_State$new(player = p, arena = a)
  expect_error(gs$player <- create_test_player())
  expect_error(gs$arena <- create_test_arena())
  expect_equal(p, gs$player)
  expect_equal(a, gs$arena)
})
