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
  expect(tibble::is_tibble(flip(mtcars, TRUE)), failure_message = "Test failed")
})
test_that("Function returns correct data", {
  expect_equivalent(flip(mtcars), data.frame(t(mtcars)))
  expect_equivalent(flip(mtcars, TRUE), tibble::as_tibble(t(mtcars)))
})
