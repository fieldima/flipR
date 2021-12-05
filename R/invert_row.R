#Roxygen tags ----------------------------------------------------------------------
#' @title Inverting data frame rows.
#'
#' @description This function will invert the order of rows in a data frame and optionally
#' returns the data frame as a tibble or data table.
#'
#' @param df Short for data frame, the first argument should be a data frame of any type.
#' @param out Short for output, this argument determines the form of the resulting data.
#' Options include 'DF' for data frame, 'TB' for tibble, and 'DT' for data table.
#'
#' @details Function will return errors if first argument is not of type data frame. out is
#' an optional argument that determines if the output is a data frame, tibble, or data table.
#' Defaults to data frame if left empty.
#'
#' @return Either a data frame, data table, or tibble with row order inverted.
#'
#' @importFrom tidyr %>%
#'
#' @export
#'
#' @examples
#' invert_row(mtcars)
#' invert_row(mtcars, "TB")

invert_row <- function (df, out) {
  if(! is.data.frame(df)) stop("First argument needs to be a data frame.")
  if(missing(out)) {
    out = "DF"
  }
  if(! out %in% c("DF", "DT", "TB")) stop("Second argument needs to be empty or a string indicating type of output.")
  result <- df %>% dplyr::slice(nrow(df):1)
  ifelse(out == "DT", result <- data.table::as.data.table(result),
         ifelse(out == "TB", result <- tibble::as_tibble(result), result <- result))
  result
}
