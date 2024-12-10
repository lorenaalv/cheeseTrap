#' Identify Treatment Misspelling Function
#'
#' Flags any observations of a categorical column that do not match the specified correct inputs. Observations may be misspelled or another input altogether that has not been updated.
#'
#' @param data the dataset for the function to act on
#' @param column the variable/column for the function to act on
#' @param correct_inputs a vector of correct inputs for the column
#'
#' @return a gt() table that outputs the rows that have incorrect inputs in the specified column
#'
#' @export
#'
#' @examples typo_flagger(data = birth, column = "Treatment", correct_inputs = c("Plac", "Tmt"))

typo_flagger <- function(data, column, correct_inputs) {
  # Step 1: Ensure correct_inputs is provided as a character vector
  if (is.null(correct_inputs) || !is.vector(correct_inputs)) {
    stop("You must provide a vector of correct inputs for the column.")
  }

  # Step 2: Identify rows with incorrect inputs in the specified column
  incorrect_spelling <- data[!data[[column]] %in% correct_inputs, ]

  # Step 3: Check if there are any incorrect inputs and display results
  if (nrow(incorrect_spelling) > 0) {
    print(paste("There are potential spelling errors detected in the column. Revise them in the following table:"))

    # Create gt table of incorrect values
    gt_table <- incorrect_spelling |>
      gt::gt() |>
      gt::tab_header(
        title = paste("Incorrect Values in", shQuote(column), "Column")
      )

    # Print GT
    print(gt_table)
  } else {
    print(paste("All column inputs are correct!"))
  }
}
