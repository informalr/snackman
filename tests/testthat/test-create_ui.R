test_that("minimal use", {
  expect_silent(create_ui())
  expect_equal(
    c("html", "character"),
    class(create_ui())
  )
})

test_that("UI has table with a table ", {
  ui <- create_ui(create_test_game_state())
  expect_equal(1, stringr::str_count(ui, "orange"))
  expect_equal(1, stringr::str_count(ui, "<table>"))
  expect_equal(3, stringr::str_count(ui, "<tr>"))
  expect_equal(1, stringr::str_count(ui, "<html>"))
  #expect_equal(1, stringr::str_count(ui, "P"))
  #expect_equal(1, stringr::str_count(ui, "<h1>Snackman</h1>"))
})
