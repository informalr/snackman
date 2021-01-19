#' Snackman game HTML
#'
#' @description fun game inspired on pacman
#' @param header The title to display over the game screen.
#' @return Panel that will load the snackman game.

#' @examples
#' \dontrun{
#' library(shiny)
#' library(snackman)
#'
#' # Add here exmaple
#'
#' }
#'
#' @export
#'
snackman_loader <- function(header="Snackman") {
  snackman_game_html <- ' <h1 style="color:white;">%s</h1> '

  shiny::div(
    shiny::fluidRow(
      shiny::column(width = 12, align = "center",
        shiny::div(id = "snackman",
          shiny::HTML(snackman_game_html)
        )
      )
    )
  )
}
