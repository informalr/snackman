#' Visualizes the state of the game in HTML
#' @inheritParams default_params_doc
#' @return a \code{c("html", "character")}
#' @export
create_ui <- function(game_state) {
  html_start <- "<html>"
  html_close <- "</html>"
  header <- '<h1 style="color:orange;">Snackman</h1>'
  arena_table <- create_html_arena_table(game_state)
  shiny::shinyUI(
    shiny::HTML(
      paste0(
        html_start,
        header,
        arena_table,
        html_close
      )
    )
  )
}
