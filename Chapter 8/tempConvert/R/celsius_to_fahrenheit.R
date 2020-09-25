#' Converts Celsius to Fahrenheit
#'
#' This function converts input temperatures in Celsius to Fahrenheit.
#' @param temp_C The temperature in Celsius.
#' @return The temperature in Fahrenheit.
#' @export
#' @examples
#' celsius_to_fahrenheit(0)

celsius_to_fahrenheit <- function(temp_C) {
  temp_F <- (temp_C * 9/5) + 32
  temp_F
}