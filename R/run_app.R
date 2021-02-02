#' Run the Shiny App
#'
#' @export
run_app <- function() {
  shiny::shinyApp(
    ui <- shiny::shinyUI(
      snackman_html()
    ),
    server <- function(input, output, session) {
    }
  )
}
