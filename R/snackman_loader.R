#' Snackman game HTML
#'
#' @description fun game inspired on pacman
#' @param header The title to display over the game.
#' @return Panel that will load the snackman game.

#' @examples
#' snackman_html()
#' snackman_html(header = "Custom header")
#' @export
#'
snackman_html <- function(header = "Snackman") {
  snackman_game_html <- sprintf(' <h1 style="color:white;">%s</h1> ', header)
  shiny::HTML(snackman_game_html)
}
