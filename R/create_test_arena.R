#' Create a simple test arena
#' @export
create_test_arena <- function() {
  cells <- c(0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1,
             0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0)
  Arena$new(matrix(cells, nrow = 6))
}
