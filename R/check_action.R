#' Check if the action is valid
#' Will \link{stop} if not
#' @export
check_action <- function(action) {
  if (!is.list(player)) {
    stop("'action' must be a list")
  }
  if (!action %in% c("left", "right", "up", "down")) {
    stop("'action' must be left, right, up or down")
  }
}
