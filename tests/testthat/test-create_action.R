test_that("can create actions silently", {
  expect_silent(create_action("player_left"))
  expect_silent(create_action_player_left())
  expect_silent(create_action_player_right())
  skip("Issue 49, Issue #49")
  expect_silent(create_no_action())
})

test_that("can create valid actions", {
  skip("Issue 48, Issue #48")
  expect_silent(check_action(create_action_player_left()))
  expect_silent(check_action(create_action_player_right()))
  skip("Issue 49, Issue #49")
  expect_silent(check_action(create_no_action()))
})
