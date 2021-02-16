#' Create a test game state
#' @export
create_test_game_state <- function() {
  create_game_state(create_test_arena(), create_test_player())
}
