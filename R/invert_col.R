#Roxygen tags ----------------------------------------------------------------------
#' @title Inverting data frame columns.
#'
#' @description This function will invert the order of columns in a data frame and optionally
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
#' @return Either a data frame, data table, or tibble with column order inverted.
#'
#' @importFrom tidyr %>%
#'
#' @export
#'
#' @examples
#' invert_col(mtcars)
#' invert_col(mtcars, "TB")

invert_col <- function (df, out) {
  if(! is.data.frame(df)) stop("First argument needs to be a data frame.")
  if(missing(out)) {
    out = "DF"
  }
  if(! out %in% c("DF", "DT", "TB")) stop("Second argument needs to be empty or a string indicating type of output.")
  names <- colnames(df) %>% rev()
  result <- df %>% dplyr::select(names)
  ifelse(out == "DT", result <- data.table::as.data.table(result),
         ifelse(out == "TB", result <- tibble::as_tibble(result), result <- result))
  result
}
