####################
###### GLOBAL ######
####################


# Load libraries
library(shiny)
library(ggvis)
library(dplyr)

# Source config and everything on the code folder
source("config.R")

for(file in list.files("code", full.names = TRUE)) {
  source(file, local = TRUE)
}


#######################
###### DATA PREP ######
#######################

# Donors used for the app
use_donors <- c("DO32875", "DO32878", "DO32900", "DO33091", "DO33256", "DO33336", "DO33344", "DO33368",
                "DO33376", "DO33392", "DO33400", "DO33408", "DO33480", "DO33512", "DO33528", "DO33544",
                "DO33552", "DO33600", "DO33632", "DO33656", "DO33984", "DO34240", "DO34264", "DO34288",
                "DO34312", "DO34368", "DO34376", "DO34432", "DO34448", "DO34600", "DO34608", "DO34656",
                "DO34696", "DO34736", "DO34785", "DO34793", "DO34801", "DO34809", "DO34817", "DO34849",
                "DO34905", "DO34961")

# Read all the tables
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

# Join snp with donors, clinvar
snp_genes <- snp %>%
  filter(icgc_donor_id %in% use_donors) %>% 
  inner_join(genes, by = c("gene_affected" = "ensembl_gene_id")) %>%
  inner_join(clinvar, by = c("hgnc_symbol" = "gene_symbol", "chromosome" = "chromosome",
                             "chromosome_start" = "start", "chromosome_end" = "stop",
                             "mutated_from_allele" = "reference_allele", "mutated_to_allele" = "alternate_allele")) 

# comment this bit out in the platform and use the view instead above
top_genes <- snp_genes %>%
  group_by(hgnc_symbol, gene_affected, mutated_from_allele, mutated_to_allele, mutation_type,
           consequence_type, chromosome, chromosome_start, chromosome_end) %>%
  summarise(count = n())

# Select columns
snp_transcripts <- snp_genes[, c("icgc_donor_id", "hgnc_symbol", "transcript_affected",
                                 "gene_affected", "chromosome", "chromosome_start", "chromosome_end",
                                 "mutated_from_allele", "mutated_to_allele", "consequence_type", "mutation_type",
                                 "clinical_significance", "dbsnp_rs_no", "review_status", "variant_id", "assembly")]

snp_genes <- snp_genes[,c('icgc_donor_id','hgnc_symbol','gene_affected', 'chromosome','chromosome_start',
                          'chromosome_end','mutated_from_allele','mutated_to_allele','consequence_type',
                          'mutation_type','clinical_significance','dbsnp_rs_no','review_status','variant_id','assembly')]

# Remove duplicates
snp_genes <- snp_genes[!duplicated(snp_genes),]



snp_clinvar <- snp %>% left_join(snp_transcripts,
                                 by = c(c('icgc_donor_id','transcript_affected','gene_affected',
                                          'chromosome','chromosome_start','chromosome_end',
                                          'mutated_from_allele','mutated_to_allele','consequence_type','mutation_type'))
)

snp$is_clinvar <- ifelse(is.na(snp_clinvar$hgnc_symbol), "No", "Yes")


## snp and struct are from the same specimens. cnv has more than one specimen per donor
specimens <- unique(snp$icgc_specimen_id)

cnv <- cnv %>% filter(icgc_specimen_id %in% specimens)

chroms <- c(1:22, "X", "Y")
lengths <- c(249250621,243199373,198022430,191154276,180915260,171115067,
             159138663,146364022,141213431,135534747,135006516,133851895,
             115169878,107349540,102531392,90354753,81195210,78077248,
             59128983,63025520,48129895,51304566,155270560,59373566)

radians_f <- create_radians(chroms[1:23], lengths[1:23])
radians_m <- create_radians(chroms, lengths)







