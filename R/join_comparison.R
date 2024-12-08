#' Join Comparison Function
#'
#' @param df1 a data frame of data from timepoint 1
#' @param df2 a data frame of data from timepoint 2
#' @param join_by input of the variable that you would like to join observations by, most likely the ‘ID’ variable
#'
#' @return a gt() table that returns the observations that did not match in the data frame between timepoint 1 and timepoint 2
#'
#' @export
#'
#' @examples An example would be measuring mouse data between timepoint 1 and timepoint 2, where ‘ID’ is the joining variable and ‘births’ and ‘body_weight’ are the two tables of the timepoint 1 and timepoint 2 mouse data. Example usage: yellow_function(births, body_weight, join_by = "id")

join_comparison <- function(df1, df2, join_by) {
  # Perform the inner join using dplyr's inner_join function
  inner_join <- dplyr::inner_join(x = df1, y = df2, by = join_by)

  rows_df1 <- nrow(df1)
  rows_inner_join <- nrow(inner_join)

  if (rows_df1 == rows_inner_join) {
    print(paste("Both data frames have the same number of rows."))
  } else {
    print(paste("The number of rows is different: df1 =", rows_df1, "and inner_join =", rows_inner_join))
    print(paste("Revise if any IDs were incorrectly modified and/or mispelled between 'df1' and 'df2'."))
  }

  excluded_df1 <- dplyr::anti_join(df1, df2, by = join_by)

  # Print excluded rows
  print(paste("Rows from 'df1' not included in the inner join by", join_by, " are printed in the following table:"))

  excluded_df1 <- dplyr::mutate(excluded_df1, characteristic = dplyr::row_number())

  excluded_df1 |>
    gt::gt(rowname_col = "characteristic") |>
    gt::tab_header(title = "Mislabeled Observation IDs")
}
