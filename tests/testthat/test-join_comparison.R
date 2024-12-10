test_that("join_comparison runs without error or warning", {
  expect_no_error(join_comparison(df1 = birth, df2 = body_weight, join_by = "ID"))
  expect_no_warning(join_comparison(df1 = birth, df2 = body_weight, join_by = "ID"))
})
