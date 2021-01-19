test_that("use", {
  expect_silent(create_action("player_left"))
  expect_silent(create_action_player_left())
  expect_silent(create_action_player_right())
})
