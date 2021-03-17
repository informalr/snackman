#' Create a simple test arena
#' @export
create_test_arena <- function() {
  test_arena <- data.frame(
    V1 = c(0, 0, 0, 0, 0, 0),
    V2 = c(1, 1, 1, 1, 0, 0),
    V3 = c(0, 0, 1, 0, 0, 0),
    V4 = c(1, 1, 1, 1, 1, 1),
    V5 = c(0, 0, 0, 0, 0, 0)
  )
  Arena$new(test_arena)
}
