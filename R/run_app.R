#' Run the Shiny App
#'
#' @export
run_app <- function() {
  shiny::shinyApp(
    ui <- snackman::create_ui(is_game_state(create_game_state(create_arena(),
                                                              create_player()
                                                              ))),
    server <- function(input, output, session) {
      # nolint indeed, server is not yet used
    }
  )
}
