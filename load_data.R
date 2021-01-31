# Script to write CSV files to the workspace database
library(purrr)

# Write a csv file to the DB
write_csv_to_db <- function(csv_file, tablename, ...) {
  df <- read.csv(csv_file, ...)
  xap.db.writeframe(df, tablename)
}

# Write a directory of csv files to the DB
write_csv_dir_to_db <- function(dir, ...) {
  filenames <- list.files(dir, full.names = TRUE, pattern = ".csv")
  tablenames <- sub(".csv", "", list.files(dir, full.names = FALSE, pattern = ".csv"), fixed = TRUE)
  
  map2(filenames, tablenames, write_csv_to_db, ...)
}

# Genome viewer has one tab separated file
filenames <- list.files("data", full.names = TRUE, pattern = ".csv")
tablenames <- sub(".csv", "", list.files("data", full.names = FALSE, pattern = ".csv"), fixed = TRUE)

clinvar <- which(tablenames == "clinvar_variant_summary")
filenames <- filenames[-clinvar]
tablenames <- tablenames[-clinvar]

map2(filenames, tablenames, write_csv_to_db)

clinvar_df <- read.table(file.path("data", "clinvar_variant_summary.csv"), header = TRUE, sep = "\t")
xap.db.writeframe(clinvar_df, "clinvar_variant_summary")
