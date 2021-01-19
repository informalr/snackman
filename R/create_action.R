#' Create an action for the player to go left
#' @export
create_action_player_left <- function() {
  action <- list()
  action$type <- "player_left"
  # Perhaps other elements (speed?) here
  action
}

#' Create an action for the player to go right
#' @export
create_action_player_right <- function() {
  action <- list()
  action$type <- "player_right"
  # Perhaps other elements (speed?) here
  action
}
