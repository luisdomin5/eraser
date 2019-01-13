#' Remove all files from environment except for the files listed as an argument
#'
#'This function will clear the environment with the exception of the files listed.
#'Please note that the current version of this function will remove datasets, vectors and functions.
#'The files that should remain in memory can be listed as a vector or as a list.
#'
#'
#' @param files List or vector of filenames that should not be removed. Please note that filenames should be quoted
#'
#' @return removes files from global environment
#' @export
#'
#' @examples
#' \dontrun{
#' iris_data <- iris
#' x <- 1
#' y <- 2
#' remove_except("iris_data")
#' #' remove_except(c("iris_data", "x")
#' #' remove_except(list("iris_data", "x")
#' }
#'
#'


remove_except <- function(files) {
  in_memory <- ls(name = .GlobalEnv)
  files_to_remove <- in_memory[!in_memory %in% files]
  rm(list=files_to_remove, envir = .GlobalEnv)
}

