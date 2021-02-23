#' Create the HTML of the arena as a table
#' @return the table as one line of HTML text
#' @export
create_html_arena_table <- function(game_state) {
  #shiny::tag()
  html <- paste0(
    "<table>",
    paste0("<tr>", game_state$arena, "<tr/>", collapse = ""),
    "<table/>"
  )
  html
}
