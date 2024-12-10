test_that("outlier_detector runs without error or warning", {
  expect_no_error(outlier_detector(data=body_weight, y_var="Body_Weight_1"))
  expect_no_warning(outlier_detector(data=body_weight, y_var="Body_Weight_1"))
})
