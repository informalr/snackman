#' Create a test game state
#' @export
create_test_game_state <- function() {
  Game_State$new(
    create_test_player(),
    create_test_arena()
  )
}
