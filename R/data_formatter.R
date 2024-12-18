#' Data Formatter Function
#'
#' Will flag rows that are non-numeric and do not follow the data format that is expected of the column.
#'
#' @param data the dataset for the function to act on
#'
#' @param columns_to_check the variable/column for the function to act on. the name requiring inspection.
#'
#' @return a gt() table that outputs the rows that have a non-numeric value in any column specified.
#'
#' @export
#'
#' @examples data_formatter(body_weight, c("Body_Weight_1", "Body_Weight_2", "Body_Weight_3"))

data_formatter <- function(data, columns_to_check) {
  # Step 1: Check if the specified columns exist in the dataframe
  if (!all(columns_to_check %in% names(data))) {
    stop("Some specified columns do not exist in the dataframe.")
  }

  # Step 2: Identify non-numeric values in the specified columns
  non_numeric_mask <- sapply(data[, columns_to_check, drop = FALSE],
                             function(columns_to_check) {
                               !suppressWarnings(!is.na(as.numeric(columns_to_check)))
                             })

  # Step 3: Filter rows with non-numeric values
  problematic_rows <- data[rowSums(non_numeric_mask) > 0, ]

  # Step 4: Display rows with non-numeric values (if any)
  if (nrow(problematic_rows) > 0) {
    print("There are some columns identified with rows containing potential non-numeric values:")

    # Create a simple gt table for the problematic rows
    gt_table <- problematic_rows |>
      dplyr::mutate(characteristic = dplyr::row_number()) |>
      gt::gt(rowname_col = "characteristic") |>
      gt::tab_header(title = "Rows Containing Non-Numeric Values")

    # Print the gt table
    print(gt_table)
  } else {
    print("No non-numeric values found in the specified columns!")
  }
}
