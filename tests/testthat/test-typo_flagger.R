test_that("typo_flagger runs without error or warning", {
  expect_no_error(typo_flagger(data = birth, column = "Treatment", correct_inputs = c("Plac", "Tmt")))
  expect_no_warning(typo_flagger(data = birth, column = "Treatment", correct_inputs = c("Plac", "Tmt")))
})
