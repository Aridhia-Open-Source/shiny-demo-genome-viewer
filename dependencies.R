package_install <- function(x, ...) {
  for (i in x) {
    # Check if package is installed
    if (!require(i, character.only = TRUE)){
      # If the package could not be loaded then install it
      install.packages(i, ...)
    }
  }
}


# Packages needed to run the app
packages <- c("shiny", "ggvis", "dplyr")

package_install(packages)
