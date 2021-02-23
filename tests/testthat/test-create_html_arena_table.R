test_that("use", {
  html_text <- create_html_arena_table(create_test_game_state())
  expect_equal(1, length(html_text))
  expect_equal(1, stringr::str_count(html_text, "<table>"))
  expect_equal(3, stringr::str_count(html_text, "<tr>"))
})
