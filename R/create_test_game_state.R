#' Create a test game state
#' @export
create_test_game_state <- function() {
  GameState$new(
    create_test_player(),
    create_test_ghosts(),
    create_test_arena()
  )
}
