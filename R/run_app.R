#' Run the Shiny App
#'
#' @export
run_app <- function() {
  shiny::shinyApp(
    ui <- create_ui(),
    server <- function(input, output, session) {
      # Process input here
    }
  )
}
