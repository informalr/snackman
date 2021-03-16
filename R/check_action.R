#' Check if the action is valid
#' @param action a list representing an action
#' Will \link{stop} if not
#' @export
check_action <- function(action) {
  if (!is.list(action)) {
    stop("'action' must be a list")
  }
  if (!action %in% c("left", "right", "up", "down")) {
    stop("'action' must be left, right, up or down")
  }
}
