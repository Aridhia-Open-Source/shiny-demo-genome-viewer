####################
######## UI ########
####################

ui <- fluidPage(
  # Style
  tags$head(
    includeCSS("www/styles.css")
  ),
  # Include JSON script
  tags$head(
    includeScript("www/ggcircos.js")
  ),
  tags$head(tags$title("Genome Viewer")),
  # Title
  HTML("<h3>Genome Viewer</h3>"),
  # Drop-down with app Help
  fluidRow(
    app_info(),
    HTML("<button type='button' class='btn' data-toggle='collapse' style='float:left' data-target='#app_info'><span class='glyphicon glyphicon-collapse-down'></span> Help</button>"),
  ),
  
  fluidRow(
    # Plot
  column(6,
         br(),
         ggvisOutput("plot")
  ),
  # Right-side column with options and table
  column(6,
    br(),
    # Select donor to display
    selectInput("donor", "Please select a donor ID:", choices = use_donors, selected = "DO49184"),
    # Change resize factor
    sliderInput("integer", "Resize Factor:", min = 1, max = 15, value = 5),
    # Drop down to choose consequence type
    HTML("<button type='button' class='btn' data-toggle='collapse' data-target='#consequence_type_selector'><span class='glyphicon glyphicon-collapse-down'></span> SNP Consequences</button>"),
    p(""),
    div(id = "consequence_type_selector", class = "collapse out", 
        checkboxGroupInput("consequence_type", "",
                           c("downstream gene variant" = "downstream_gene_variant",
                             "upstream gene variant" = "upstream_gene_variant",
                             "intergenic region" = "intergenic_region",
                             "synonymous variant" = "synonymous_variant",
                             "5' prime UTR premature start codon gain variant" = "5_prime_UTR_premature_start_codon_gain_variant",
                             "5' prime UTR variant" = "5_prime_UTR_variant",
                             "3' prime UTR variant" = "3_prime_UTR_variant",
                             "intron variant" = "intron_variant",
                             "intragenic variant" = "intragenic_variant",
                             "splice region variant" = "splice_region_variant",
                             "splice donor variant" = "splice_donor_variant",
                             "exon variant" = "exon_variant",
                             "non coding exon variant" = "non_coding_exon_variant",
                             "initiator codon variant" = "initiator_codon_variant",
                             "inframe insertion" = "inframe_insertion",
                             "inframe deletion" = "inframe_deletion",
                             "missense variant" = "missense_variant",
                             "stop gained" = "stop_gained",
                             "stop lost" = "stop_lost",
                             "stop retained_variant" = "stop_retained_variant",
                             "start lost" = "start_lost",
                             "frameshift variant" = "frameshift_variant"),
                           selected = c("stop_gained", "frameshift_variant", "missense_variant", "exon_variant", "start_lost", "stop_lost", "5_prime_UTR_premature_start_codon_gain_variant",
                                        "intron_variant", "upstream_gene_variant") )
    ),
    p(""),
    # Table with most common mutations
    h4("Cohort Top ClinVar Gene Summary"),
    dataTableOutput("top_clinvar_genes"),
    br(),   
    h4("Selected Genes:"),
    div(id = "genes_div"),
    h4("Selected Transcripts:"),
    div(id = "transcripts_div"),
    h4("ClinVar Record:"),
    div(id = "clinvar_div")
  )),
  fluidRow(
    column(12,
      HTML("<br><div class='footer'></div><br>")
    )
  )
)
