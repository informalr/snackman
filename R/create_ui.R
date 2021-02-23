#' Visualizes the state of the game in HTML
#' @inheritParams default_params_doc
#' @return a \code{c("html", "character")}
create_ui <- function(game_state) {
  shiny::shinyUI(
    snackman_html()
  )
}
