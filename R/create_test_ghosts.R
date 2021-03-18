#' Create a list with ghosts for testing purposes
#' @export
create_test_ghosts <- function() {
  list(
    Ghost$new(4, 1, "chase"),
    Ghost$new(4, 6, "ambush")
  )
}
