#' Create the HTML of the arena as a table
#' @return the table as one line of HTML text
#' @export
create_html_arena_table <- function(game_state) {
  shiny::tagList(
    shiny::tags$table(
      # Make this into a loop to iterate over arena's rows
      shiny::tags$tr(game_state$arena[1]),
      shiny::tags$tr(game_state$arena[2]),
      shiny::tags$tr(game_state$arena[3])
    )
  )
}
