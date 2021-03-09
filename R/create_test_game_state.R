#' Create a test game state
#' @export
create_test_game_state <- function() {
  snackman::create_game_state(
    snackman::create_test_arena(),
    snackman::create_test_player()
  )
}
