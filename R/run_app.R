#' Run the Shiny App
#'
#' @export
run_app <- function() {
  shiny::shinyApp(
    ui <- create_ui(snackman::create_test_game_state()),
    server <- function(input, output, session) {
      # Process input here
    }
  )
}
