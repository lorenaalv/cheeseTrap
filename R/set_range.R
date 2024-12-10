#' Set Range Function
#'
#' Flags any rows that are outside of a set range of values by a numerical column.
#'
#' @param data the dataset for the function to act on
#'
#' @param column_name the column for the function to act on, required to be numeric in type but the function handles non-numeric cases as well with a warning.
#'
#' @param min_value the minimum numerical value for the range of the column
#' @param max_value the maximum numerical value for the range of the column
#'
#'
#' @return 2 gt() tables. The first table will show non-numeric values within the dataset to warn the user. The second table draws from the numeric values (the data excluding the non-numeric values) and from observations that fit the specific numeric range set by the user.
#'
#' @export
#'
#' @examples set_range(data=social_dominance, column_name="Q2", min_value=1, max_value=6)

set_range <- function(data, column_name, min_value, max_value) {
  if (!column_name %in% colnames(data)) {
    stop("Column not found in the data frame.")
  }

  non_numeric_mask <- !suppressWarnings(!is.na(as.numeric(data[[column_name]])))
  problematic_rows <- data[non_numeric_mask, ]

  if (nrow(problematic_rows) > 0) {
    print("Rows with non-numeric values:")

    gt_table <- problematic_rows |>
      dplyr::select(column_name) |>
      dplyr::mutate(characteristic = dplyr::row_number()) |>
      gt::gt(rowname_col = "characteristic") |>
      gt::tab_header(title = paste("Rows Containing Non-Numeric Values in", column_name))

    print(gt_table)
  } else {
    print("No non-numeric values found in the specified column.")
  }

  data[[column_name]] <- suppressWarnings(as.numeric(as.character(data[[column_name]])))

  filtered_rows <- data |>
    dplyr::filter(!is.na(.data[[column_name]]) & (.data[[column_name]] < min_value | .data[[column_name]] > max_value))

  if (nrow(filtered_rows) > 0) {
    message <- paste("Rows where", column_name, "falls outside the range:", min_value, "to", max_value)
    print(message)

    filtered_rows |>
      gt::gt() |>
      gt::tab_header(
        title = paste("Observations in", column_name, "outside", min_value, "to", max_value)
      ) |>
      print()
  } else {
    message <- paste("No observations fall outside the range of", min_value, "and", max_value, "for", column_name)
    print(message)
  }
}
