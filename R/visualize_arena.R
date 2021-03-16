library(leaflet)
library(raster)

#' Arena visualiseren
#'
#' Een testfunctie om wat dingetjes uit te proberen
#'
#' @return
#' @export
#'
#' @examples
visualize_arena <- function() {
  # https://leafletjs.com/examples/crs-simple/crs-simple.html
  # https://stackoverflow.com/questions/47170828/overlay-image-on-r-leaflet-map
  crs <- leafletCRS(
    crsClass = "L.CRS.Simple"
  )
  file <- paste0("'https://raw.githubusercontent.com/informalr/",
                 "snackman/master/inst/extdata/sketch_20210112.png';")
  map <- leaflet(
    width = 918,
    height = 548,
    options = leafletOptions(crs = crs)
  ) %>%
    setView(459, 274, 0) %>%
    htmlwidgets::onRender(
      paste0("
        function(el, x) {
          console.log(this);
          var myMap = this;
          var imageUrl = ",
          file,
          "var imageBounds = [[0, 0], [548, 918]];
          L.imageOverlay(imageUrl, imageBounds).addTo(myMap);
        }
      ")
    )
  map
}
