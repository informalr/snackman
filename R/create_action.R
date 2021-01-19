#' Create an action for the player to go left
#' @param action_type the type of action
#' @export
create_action <- function(action_type) {
  action <- list()
  action$type <- action_type
  # Perhaps other elements (speed?) here
  action
}

#' Create an action for the player to go left
#' @note this function must call \link{create_action} to
#'   inherit everything what an action is
#' @export
create_action_player_left <- function() {
  action <- create_action("player_left")
  # Perhaps other elements (speed?) here
  action
}

#' Create an action for the player to go right
#' @note this function must call \link{create_action} to
#'   inherit everything what an action is
#' @export
create_action_player_right <- function() {
  action <- create_action("player_right")
  # Perhaps other elements (speed?) here
  action
}
