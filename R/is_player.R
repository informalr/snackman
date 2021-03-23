#' Check if an object is a valid player.
#'
#' @param player Player.
#'
#' @return logical, `TRUE` for a valid and `FALSE` for an invalid player.
is_player <- function(player) {
  identical(class(player), c("Player", "R6"))
}
