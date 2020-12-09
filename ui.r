
use_donors <- c("DO32875", "DO32878", "DO32900", "DO33091", "DO33256", "DO33336", "DO33344", "DO33368",
                "DO33376", "DO33392", "DO33400", "DO33408", "DO33480", "DO33512", "DO33528", "DO33544",
                "DO33552", "DO33600", "DO33632", "DO33656", "DO33984", "DO34240", "DO34264", "DO34288",
                "DO34312", "DO34368", "DO34376", "DO34432", "DO34448", "DO34600", "DO34608", "DO34656",
                "DO34696", "DO34736", "DO34785", "DO34793", "DO34801", "DO34809", "DO34817", "DO34849",
                "DO34905", "DO34961")

options(shiny.table.class = "data table table-striped table-condensed ")

shinyUI(fluidPage(
  tags$head(
    includeCSS("www/styles.css")
  ),
  
  tags$head(
    includeScript("www/ggcircos.js")
  ),

  HTML("<h3>Genome Viewer</h3>"),
  fluidRow(
  column(7,
    div(id = "app_info", class = "collapse out", 
      p("This visualisation is based on Circos, a way of visualising whole genomes. Here we are using data taken from the ICGC, specifically pancreatic adenocarcinoma tumour samples
        from various donors. See:"),             
      tags$a(href = "https://dcc.icgc.org/repository/icgc/release_19/Projects/PACA-AU", "https://dcc.icgc.org/repository/icgc/release_19/Projects/PACA-AU"),
      p(""),
      p("Firstly, if the plot isn't quite the optimal size, locate the edge at the very bottom right corner of the plot, which will allow you to drag the size in and out."),
      p("The Circos-style plot shows a number of layers, starting from the outer layer representing colour and size distinguished chromsomes, moving clockwise from chromosome 1 to 22, then X and Y. Inside the chromosomes ring, you can see a line representation of copy number mutations. When expanded (by clicking a chromosome), more details on the precise copy number at specific locations is revealed. Hover the bars for further details."),
      p("Moving inwards, counts of transcripts are shown as scatter plots. The more outer the point, the more transcripts affected by the mutation at that coordinate. The points are both colour and shape coded, green and blue points showing the insertions and deletions, whereas red points show single point mutations. Those SNPs marked by a cross indicate mutations with an associated ClinVar record. The 'SNP Consequence' checkbox group can be used to filter out mutations, by default we've selected only mutations in or around the coding regions of the genome. 
        Hovering on a point provides more information, and reveals further links to view the genes or transcripts in Ensembl. The tooltips presented when hovering reveal further links,  or save interesting genes in the app as a list to refer back to."),
      p("Finally the inner ribbons represent portions of the genome that have been restructured relative to the Hg19 reference genome, known as structural variants."),  
      p("For further information, visit the Australian Pancreatic Cancer Genome Initiative (APGI) project summary page:"),
      tags$a(href = "https://icgc.org/icgc/cgp/68/304/798", "https://icgc.org/icgc/cgp/68/304/798")  
    ),
    
    HTML("<button type='button' class='btn' data-toggle='collapse' style='float:left' data-target='#app_info'><span class='glyphicon glyphicon-collapse-down'></span> More Information</button>"),
    br(),
    br(), 
    ggvisOutput("plot")
  ),
  
  column(5,
    br(),
    h4("Cohort Top ClinVar Gene Summary:"),
    tableOutput("top_clinvar_genes"),
    br(),   
    selectInput("donor", "Please select a donor ID:", choices = use_donors, selected = "DO49184"),
    sliderInput("integer", "Resize Factor:", min = 1, max = 15, value = 5),
    HTML("<button type='button' class='btn' data-toggle='collapse' data-target='#consequence_type_selector'><span class='glyphicon glyphicon-collapse-down'></span> SNP Consequences</button>"),
    p(""),
    div(id = "consequence_type_selector", class = "collapse out", 
      checkboxGroupInput("consequence_type", "SNP Consequence:",
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
)