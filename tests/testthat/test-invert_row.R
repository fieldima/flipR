test_that("Invalid arguments return errors", {
  expect_error(invert_row(1))
  expect_error(invert_row(""))
  expect_error(invert_row(NA))
  expect_error(invert_row(mtcars, 1))
  expect_error(invert_row(mtcars, NA))
  expect_error(invert_row(mtcars, "a"))
})

test_that("Function returns correct types", {
  expect(is.data.frame(invert_row(mtcars)), failure_message = "Test failed")
  expect(tibble::is_tibble(invert_row(mtcars, "TB")), failure_message = "Test failed")
  expect(data.table::is.data.table(invert_row(mtcars, "DT")), failure_message = "Test failed")
})

mt <- mtcars[1:3,]
mt_inv <- mt[3:1,]

test_that("Function returns correct data", {
  expect_equal(invert_row(mt), mt_inv)
  expect_equal(invert_row(mt, "TB"), tibble::as_tibble(mt_inv))
  expect_equal(invert_row(mt, "DT"), data.table::as.data.table(mt_inv))
})
