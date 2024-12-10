test_that("set_range runs without error or warning", {
  expect_no_error(set_range(data=social_dominance, column_name="Q2", min_value=1, max_value=4))
  expect_no_warning(set_range(data=social_dominance, column_name="Q2", min_value=1, max_value=4))
})
