#' Check if the arena is valid
#' Needs to have at least 3 lines
#' All lines need to have the same amount of characters
#'
#' Will \link{stop} if not
#' @export
check_arena <- function(arena_text) {
  if (length(arena_text) < 3) {
    stop("'arena' must have at least 3 rows")
  }
  TRUE
}
