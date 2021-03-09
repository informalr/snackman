#' Run the Shiny App
#'
#' @export
run_app <- function() {
  shiny::shinyApp(
    ui <- shiny::shinyUI( # nolint indeed, ui is not yet used
      snackman::snackman_html()
    ),
    server <- function(input, output, session) { # nolint indeed, server is not yet used
    }
  )
}
