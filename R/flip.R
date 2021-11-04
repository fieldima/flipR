#Roxygen tags -----------------------------------------------------------------------
#' @title Flipping data frames.
#'
#' @description This function flips rows and columns in a data frame and optionally returns
#' the flipped data frame as a tibble.
#'
#' @param df Short for data frame, the first argument should be a data frame of any type.
#' @param tib Short for tibble, a logical argument describing if data should be returned
#' in tibble format or not. Default is FALSE.
#'
#' @details Function will return errors if first argument is not of type data frame. tib is
#' an optional argument that will default to FALSE if left empty.
#'
#' @return Either a data frame or tibble with columns and rows flipped.
#' @export

flip <- function (df, tib) {
  if(! is.data.frame(df)) stop("First argument needs to be a data frame.")
  if(missing(tib)) {
    tib = FALSE
  }
  if(! is.logical(tib)) stop("Second argument needs to be empty or of type logical.")
  final <- data.frame(t(df))
  if(tib == TRUE) {
    final = tibble::as_tibble(final)
  }
  final
}
