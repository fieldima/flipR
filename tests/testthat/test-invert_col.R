test_that("Invalid arguments return errors", {
  expect_error(invert_col(1))
  expect_error(invert_col(""))
  expect_error(invert_col(NA))
  expect_error(invert_col(mtcars, 1))
  expect_error(invert_col(mtcars, NA))
  expect_error(invert_col(mtcars, "a"))
})

test_that("Function returns correct types", {
  expect(is.data.frame(invert_col(mtcars)), failure_message = "Test failed")
  expect(tibble::is_tibble(invert_col(mtcars, "TB")), failure_message = "Test failed")
  expect(data.table::is.data.table(invert_col(mtcars, "DT")), failure_message = "Test failed")
})

mt <- mtcars[1:3]
mt_inv <- mt[3:1]

test_that("Function returns correct data", {
  expect_equal(invert_col(mt), mt_inv)
  expect_equal(invert_col(mt, "TB"), tibble::as_tibble(mt_inv))
  expect_equal(invert_col(mt, "DT"), data.table::as.data.table(mt_inv))
})
