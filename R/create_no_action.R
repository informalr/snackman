#' Create 'no action'
#'
#' This function creates an Action with type 'none'.
#'
#' @return Action.
#' @export
create_no_action <- function() {
  Action$new("none")
}
