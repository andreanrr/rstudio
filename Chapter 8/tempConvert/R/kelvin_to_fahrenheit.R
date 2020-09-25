#' Converts Kelvin to Fahrenheit
#'
#' This function converts input temperatures in Kelvin to Fahrenheit.
#' @param temp_K The temperature in Kelvin.
#' @return The temperature in Fahrenheit.
#' @export
#' @examples
#' kelvin_to_fahrenheit(273.15)

kelvin_to_fahrenheit <- function(temp_K) {
  temp_C <- kelvin_to_celsius(temp_K)
  temp_F <- celsius_to_fahrenheit(temp_C)
  temp_F
}