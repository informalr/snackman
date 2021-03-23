#' Create a list with ghosts for testing purposes
#' @export
create_test_ghosts <- function() {
  list(
    # For now there can be only one ghost in the game
    Ghost$new(4, 1, "chase")
  )
}
