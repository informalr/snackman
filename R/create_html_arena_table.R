#' Create the HTML of the arena as a table
#' @return the table as one line of HTML text
#' @export
create_html_arena_table <- function(game_state) {
  shiny::tagList(
    shiny::tags$table(
      # Make this into a loop to iterate over arena's rows
      shiny::tags$tr(
        shiny::tags$td(stringr::str_sub(game_state$arena[1], 1, 1)),
        shiny::tags$td(stringr::str_sub(game_state$arena[1], 2, 2)),
        shiny::tags$td(stringr::str_sub(game_state$arena[1], 3, 3))
      ),
      shiny::tags$tr(
        shiny::tags$td(stringr::str_sub(game_state$arena[2], 1, 1)),
        shiny::tags$td(stringr::str_sub(game_state$arena[2], 2, 2)),
        shiny::tags$td(stringr::str_sub(game_state$arena[2], 3, 3))
      ),
      shiny::tags$tr(
        shiny::tags$td(stringr::str_sub(game_state$arena[3], 1, 1)),
        shiny::tags$td(stringr::str_sub(game_state$arena[3], 2, 2)),
        shiny::tags$td(stringr::str_sub(game_state$arena[3], 3, 3))
      )
    )
  )
}
