#' Check if the player is valid
#' Will \link{stop} if not
#' @export
check_player <- function(player) {
  if (!is.list(player)) {
    stop("'player' must be a list")
  }
  if (!"x" %in% names(player)) {
    stop("'player' must be a list with the element 'x'")
  }
}
