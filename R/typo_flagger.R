#' Typo Flagger Function
#'
#' @param data ADD YOUR PARAMETERS HERE AND WHAT THEY SHOULD BE (requirements, data types, etc.)
#' @param x
#'
#' @return ADD DESCRIPTION FOR WHAT YOUR FUNCTION RETURNS (what it is, data type, etc.)
#' @export
#'
#' @examples ADD EXAMPLES OF HOW TO APPLY YOUR FUNCTION

typo_flagger <- function(data, x){
  # Find the 10 top based on x
  top10x <- dplyr::count(data, {{x}}) |>
    dplyr::slice_max(n = 10, order_by = n) |>
    dplyr::select({{x}}) |>
    dplyr::pull()
  # Filter dataset to only the 10 top based on x
  return(dplyr::filter(data, {{x}} %in% top10x))
}
