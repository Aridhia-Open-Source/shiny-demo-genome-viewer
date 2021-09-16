#######################
####### APP INFO ######
#######################


app_info <- function() {
  
  div(id = "app_info", class = "collapse out",
  p("This RShiny mini-app allows you to visualise whole genomes usig Circos. This app uses data taken from the", tags$a(href = "https://dcc.icgc.org/", "ICGC"),
    ". Specifically, the data comes from a project led by Sean M. Grimmond and Andrew V. Biankin, who gathered samples of pancreatic adenocarcinoma tumours from various donors", 
    tags$a(href = "https://dcc.icgc.org/repository/icgc/release_19/Projects/PACA-AU", "(PACA-AU)") , "."), 
  h3("How to use the App"),
  p("The ", strong("Circos-style plot"), " has a number of layers (from outwards to inwards):"),
  tags$ol(
    tags$li("Shows the size of chromosomes, from chromosome 1 to 22, X and Y (moving clockwise) each one in a different color"),
    tags$li("A line representation of the number of mutations within a chromosome. When expanded (by clicking the previous layer), more details are revealed."),
    tags$li("Scatter plots showing the counts of transcripts. The more outer the point is, the more transcripts affected by the mutation at that coordinate. The points are 
    both colour and shape coded, green and blue points showing the insertions and deletions, whereas red points show single point mutations. Those SNPs marked by a cross indicate 
    mutations with an associated ClinVar record."),
    tags$li("The inner ribbons represent portions of the genome that have been restructured relative to the Hg19 reference genome, these are known as structural variants.")
  ),
  p("This is an interactive plot, if you hover over the different elements, more information will appear, as well as furhter links to view the genes or transcripts in Ensembl and ClinVar."),
  p("You can change the size of the plot using the edge at the bottom right."),
  p("On the right-side of the screen you will see:"),
  tags$ol(
    tags$li("A ", strong("table"), " displaying the most common mutations amongst the donors"),
    tags$li("A ", strong("slinder input "), "to switch between different donors"),
    tags$li("The ", strong('SNP Consequence'), "checkbox group can be used to filter out mutations, by default we've selected only mutations in or around 
    the coding regions of the genome.")
  ),
  h3("Video"),
  tags$video(src="genome-viewer.mp4", type = "video/mp4", frameborder = "0", height = "350", controls = NA),
  p(class = "nb", "NB: This mini-app is provided for demonstration purposes only, is unsupported and is utilised at user's risk. If you plan to use this mini-app
    to inform your study, please review the code and ensure you are comfortable with the calculations made before proceeding.")
  )
  
  
  
  
}
