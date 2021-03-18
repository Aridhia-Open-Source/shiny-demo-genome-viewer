####################
###### CONFIG ######
####################

list_data <- function() {
  list.files("data", pattern = "\\.csv$")
}

read_data <- function(table_name) {
  read.csv(file.path("data", paste0(table_name, ".csv")), stringsAsFactors = FALSE)
}


read_data_tab <- function(table_name) {
  csv_name <- paste0(file.path("data", table_name),
                     ".csv")
  d <- read.table(csv_name, stringsAsFactors = FALSE, sep = "\t", header = TRUE)
  names(d) <- tolower(names(d))
  d
}