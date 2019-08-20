xap.require(
  "shiny",
  "ggvis",
  "dplyr"
)

# This is source code for some version of ggcircos
source("ggcircos_helpers.r")

xap.read_table_tab <- function(table_name) {
  proj_path <- project_path()
  csv_name <- paste0(file.path(proj_path, "workspace", table_name),
                     ".csv")
  d <- read.table(csv_name, stringsAsFactors = FALSE, sep = "\t", header = TRUE)
  names(d) <- char_replace(tolower(names(d)))
  d
}

use_donors <- c("DO32875", "DO32878", "DO32900", "DO33091", "DO33256", "DO33336", "DO33344", "DO33368",
                "DO33376", "DO33392", "DO33400", "DO33408", "DO33480", "DO33512", "DO33528", "DO33544",
                "DO33552", "DO33600", "DO33632", "DO33656", "DO33984", "DO34240", "DO34264", "DO34288",
                "DO34312", "DO34368", "DO34376", "DO34432", "DO34448", "DO34600", "DO34608", "DO34656",
                "DO34696", "DO34736", "DO34785", "DO34793", "DO34801", "DO34809", "DO34817", "DO34849",
                "DO34905", "DO34961")

donors <- xap.read_table("donors_clean") %>%
  filter(icgc_donor_id %in% use_donors)

snp <- xap.read_table("snp_clean") %>%
  filter(icgc_donor_id %in% use_donors, chromosome != "MT")

struct <- xap.read_table("struct_clean") %>%
  filter(icgc_donor_id %in% use_donors) 

cnv <- xap.read_table("cnv_clean") %>%
  filter(icgc_donor_id %in% use_donors)

genes <- xap.read_table("genes")
top_genes <- xap.read_table("icgc_top_genes")

# temporary workaround to resolve tab separation in clinvar data
if(exists("xap.conn")) {
  clinvar <- xap.read_table("clinvar_variant_summary") %>%
    mutate(chromosome = as.character(chromosome))
} else {
  clinvar <- xap.read_table_tab("clinvar_variant_summary") %>%
    mutate(chromosome = as.character(chromosome))
}
