#' Create the UI from ...?
#' @return a \code{c("html", "character")}
create_ui <- function() {
  shiny::shinyUI(
    snackman_html()
  )
}
