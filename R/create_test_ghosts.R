#' Create a list with ghosts for testing purposes
#' @export
create_test_ghosts <- function() {
  list(
    Ghost$new(1, 1, "chase"),
    Ghost$new(1, 1, "ambush"),
    Ghost$new(1, 1, "freak"),
    Ghost$new(1, 1, "idiot")
  )
}
