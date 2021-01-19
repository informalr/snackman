#' Run the Shiny App
#'
#' @export
run_app <- function() {
  shiny::shinyApp(
    ui <- shiny::shinyUI(
      shiny::fluidPage(
        shiny::titlePanel("Snackman"),
          snackman_loader(),
      )
    ),
    server <- function(input, output, session) {
    }
  )
}
