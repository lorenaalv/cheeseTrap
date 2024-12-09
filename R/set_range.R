#' Set Range Function
#'
#' @param data the dataset for the function to act on
#'
#' @param columns_to_check the variable/column for the function to act on. the name requiring inspection.
#'
#' @return a gt() table that outputs the rows that have a non-numeric value in any column specified.
#'
#' @export
#'
#' @examples non_numeric_rows <- identify_non_numeric(Body_Weight, c("Body Weight 1", "Body Weight 2", "Body Weight 3"))
#' An example would be wanting to inspect the Body Weight columns to see if there is any incorrect inputs or intentional non-numeric values used to describe the weight

set_range <- function(data, columns_to_check) {

}
