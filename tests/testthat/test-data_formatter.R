test_that("data_formatter runs without error or warning", {
  expect_no_error(data_formatter(body_weight, c("Body_Weight_1", "Body_Weight_2", "Body_Weight_3")))
  expect_no_warning(data_formatter(body_weight, c("Body_Weight_1", "Body_Weight_2", "Body_Weight_3")))
})
