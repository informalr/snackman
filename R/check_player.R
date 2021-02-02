#' Check if the player is valid
#' @param player game player
#' Will \link{stop} if not
#' @export
check_player <- function(player) {
  if (!is.list(player)) {
    stop("'player' must be a list")
  }
  if (!"x" %in% names(player)) {
    stop("'player' must be a list with the element 'x'")
  }
  if (!"y" %in% names(player)) {
    stop("'player' must be a list with the element 'y'")
  }
  if (!"size" %in% names(player)) {
    stop("'player' must be a list with the element 'size'")
  }
}
