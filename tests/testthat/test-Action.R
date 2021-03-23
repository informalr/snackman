test_that("use", {
  expect_silent(action_player_right <- Action$new("right"))
  expect_equal(action_player_right$type, "right")
  expect_silent(action_player_left <- Action$new("left"))
  expect_equal(action_player_left$type, "left")
  expect_silent(action_player_up <- Action$new("up"))
  expect_equal(action_player_up$type, "up")
  expect_silent(action_player_down <- Action$new("down"))
  expect_equal(action_player_down$type, "down")
  expect_silent(action_player_no_action <- Action$new("none"))
  expect_equal(action_player_no_action$type, "none")
  expect_error(
    Action$new("nonsense"),
    "'action' must be right, left, up, down or none"
  )
})

test_that("things are private", {
  type <- "up"
  action <- Action$new(type = type)
  expect_error(action$type <- "down")
  expect_equal(type, action$type)
})
