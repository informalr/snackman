test_that("use", {
  arena <- c(
    "XXXXX",
    "X...X",
    "X..XX",
    "X...X",
    "XXXXX"
  )

  player <- list()
  player$x <- 100.0
  player$y <- 200.0
  player$size <- 1

  expect_silent(create_game_state(arena, player))
  g <- create_game_state(arena, player)
  expect_type(g, "list")
  expect_equal(names(g)[1], "arena")
  expect_type(g$arena, "character")
  expect_equal(names(g)[2], "player")
  expect_type(g$player, "list")
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
