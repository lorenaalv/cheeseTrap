#' Outlier Detector Function
#'
#' @param data the dataset for the function to act on
#' @param y_var the variable/column for the function to act on. should be quantitative, but the function handles this as well through coercion.
#'
#' @return the function will return an interactive plot where the user can identify on their own end any outliers. the function also returns
#' @export
#'
#' @examples ADD EXAMPLES OF HOW TO APPLY YOUR FUNCTION

outlier_detector <- function(data, y_var) {
  # confirming user inputted column exist
  if (!y_var %in% colnames(data)) {
    stop("Your inputted column does not exist in the dataset.")
  }

  # assigning each row a numerical ID to use for scatterplot
  data$Row_Number <- seq_len(nrow(data))

  # converting to ensure columns are numeric
  data[[y_var]] <- as.numeric(data[[y_var]])

  # dropping any rows that were not numeric (this is another issue, should be handled differently)
  data <- dplyr::filter(data, !is.na(data[[y_var]]))

  # numerically calculate outliers for the y_var
  mean_y <- mean(data[[y_var]], na.rm = TRUE)
  std_y <- sd(data[[y_var]], na.rm = TRUE)

  # outliers are +- 2.5 std from mean
  outliers <- data[abs(data[[y_var]] - mean_y) >= 2.5 * std_y, ]

  if (nrow(outliers) == 0) {
    cat("There are no outliers found in the column data. Outliers were calculated as any values being 2.5 standard deviations away from the mean.\n",
        "To confirm, review the following scatterplot and table.\n")
  } else {
    cat("Your inputted column is suspected of containing outliers.\n",
        "Outliers were calculated as any values being 2.5 standard deviations away from the mean.\n",
        "The suspected outliers and their corresponding Row_Number are printed in the following table.\n",
        "Revise the scatterplot to confirm if these data are outliers.\n")
  }

  # scatterplot
  scatterplot <- ggplot2::ggplot(data, ggplot2::aes(Row_Number, y = .data[[y_var]])) +
    ggplot2::geom_point() +
    ggplot2::labs(title = "Scatterplot",
                  y = y_var)

  interactive_plot <- plotly::ggplotly(scatterplot)

  # outlier table using gt
  outlier_table <- outliers |>
    dplyr::select(Row_Number, !!y_var := .data[[y_var]]) |>
    gt::gt() |>
    gt::tab_header(
      title = "Outlier Detection Results"
    ) |>
    gt::tab_spanner(
      label = "Outliers",
      columns = c(Row_Number, !!y_var)
    ) |>
    gt::cols_label(
      Row_Number = "Row_Number",
      !!y_var := y_var
    )
  print(interactive_plot)
  print(outlier_table)
}
