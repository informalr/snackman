test_that("minimal use", {
  expect_silent(create_ui())
  expect_equal(
    c("html", "character"),
    class(create_ui())
  )
})

test_that("minimal use", {
  ui <- create_ui(create_test_game_state())
  stringr::str_match(ui, "<table>")
  stringr::str_match(ui, "<tr>")
})
