#' Remove all files from environment except for the files listed as an argument
#'
#'This function will clear the environment with the exception of the files listed.
#'Please note that the current version of this function will remove datasets, vectors and functions.
#'The files that should remain in memory can be listed as a vector or as a list.
#'
#'
#' @param objects List or vector of object names that should not be removed. Please note that filenames should be quoted
#'
#' @param remove_action By default, remove_action is TRUE and will remove all files except the ones listed in objects.
#' If FALSE, the function will return a list of all functions that will be removed.
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
#' remove_except(c("iris_data", "x")
#' remove_except(list("iris_data", "x")
#' }
#'
#'

rm_except <- function(objects, remove_action = TRUE) {

  in_memory <- ls(name = .GlobalEnv)
  objects_to_remove <- in_memory[!in_memory %in% objects]

  if (length(in_memory) == length(objects_to_remove)) {
    stop("Attempt to erase full history stopped. Please ensure the exception files are correctly spelled and quoted.")
  }


  if (!remove_action){
    return(objects_to_remove)
  }
  else {
    rm(list = objects_to_remove, envir = .GlobalEnv)
  }

}

