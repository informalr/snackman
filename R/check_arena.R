#' Check if the arena is valid
#' Needs to have at least 3 lines
#' All lines need to have the same amount of characters
#'
#' Will \link{stop} if not
#' @export
check_arena <- function(arena_text) {
  if (!is.character(arena_text)) {
    stop("'arena' must be of character type")
  }
  if (length(arena_text) < 3) {
    stop("'arena' must have at least 3 rows")
  }
  if (any(nchar(arena_text) < 3)) {
    stop("Each row in the arena must have at least 3 characters")
  }
  if (length(unique(nchar(arena_text))) != 1) {
    stop("Each row in the arena must have the same number of characters")
  }

}
