#' Identify Treatment Misspelling Function
#'
#' @param data the dataset for the function to act on
#' @param x the variable/column for the function to act on
#' @param correct_inputs A vector of correct inputs for the column
#'
#' @return a gt() table that outputs the rows that have incorrect inputs in the specified column
#'
#' @export
#'
#' @examples check_births(Birth, "Treatment") An example would be alerting the user that there are value(s) other than Plac and Tmt in the treatment column

typo_flagger <- function(data, column) {
  # Step 1: Define correct treatment
  correct_spelling <- c("Plac", "Tmt")

  # Step 2: Identify rows with incorrect values in the specified 'Treatment' column
  incorrect_spelling <- data[!data[[column]] %in% correct_spelling, ]

  # Step 3:IF any, dusplay incorrect spelling
  if (nrow(incorrect_spelling) > 0) {
    print("There are potential spelling errors detected in the column(s). Revise them in the following table:")

    # Create gt table of incorrect values
    gt_table <- incorrect_spelling |>
      gt::gt(rowname_col = "characteristic") |>
      gt::tab_header(title = "Incorrect Values in 'Treatment' Column")

    # Print GT
    print(gt_table)
  } else {
    print("All column values are correct!")
  }
}

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
