#' Create a general action
#' @param action_type the type of action
#' @export
create_action <- function(action_type) {
  action <- list()
  action$type <- action_type
  action
}

#' Action to make the player go left
#' @note this function must call \link{create_action} to
#'   inherit everything what an action is
#' @export
create_action_player_left <- function() {
  action <- create_action("player_left")
  # TODO: if needed, add more parameters for this action
  action
}

#' Action to make the player go right
#' @note this function must call \link{create_action} to
#'   inherit everything what an action is
#' @export
create_action_player_right <- function() {
  action <- create_action("player_right")
  # TODO: if needed, add more parameters for this action
  action
}
