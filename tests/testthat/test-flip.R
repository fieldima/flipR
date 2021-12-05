test_that("Invalid arguments return errors", {
  expect_error(flip(1))
  expect_error(flip(""))
  expect_error(flip(NA))
  expect_error(flip(mtcars, 1))
  expect_error(flip(mtcars, NA))
  expect_error(flip(mtcars, "a"))
})

test_that("Function returns correct types", {
  expect(is.data.frame(flip(mtcars)), failure_message = "Test failed")
  expect(tibble::is_tibble(flip(mtcars, "TB")), failure_message = "Test failed")
  expect(data.table::is.data.table(flip(mtcars, "DT")), failure_message = "Test failed")
})
test_that("Function returns correct data", {
  expect_equal(flip(mtcars), data.frame(t(mtcars)))
  expect_equal(flip(mtcars, "TB"), tibble::as_tibble(data.frame(t(mtcars))))
  expect_equal(flip(mtcars, "DT"), data.table::as.data.table(data.frame(t(mtcars))))
})
