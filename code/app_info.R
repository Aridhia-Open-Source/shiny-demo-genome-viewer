#######################
####### APP INFO ######
#######################


app_info <- function() {
  
  div(id = "app_info", class = "collapse out",
  h4("Introduction"),
  p("This RShiny mini-app allows you to visualise whole genomes usig Circos. This app uses data taken from the", tags$a(href = "https://dcc.icgc.org/", "ICGC"),
    ". Specifically, the data comes from a project led by Sean M. Grimmond and Andrew V. Biankin, who gathered samples of pancreatic adenocarcinoma tumours from various donors", 
    tags$a(href = "https://dcc.icgc.org/repository/icgc/release_19/Projects/PACA-AU", "(PACA-AU)") , "."), 
  h4("How to use the App"),
  p("Firstly, if the", strong(" plot"), " isn't quite the optimal size, locate the edge at the very bottom right corner of the plot, which will allow you to drag the size in and out."),
  p("The Circos-style plot shows a number of layers, starting from the outer layer representing colour and size distinguished chromsomes, moving clockwise from chromosome 1 to 22, 
    then X and Y. Inside the chromosomes ring, you can see a line representation of copy number mutations. When expanded (by clicking a chromosome), more details on the precise 
    copy number at specific locations is revealed. Hover the bars for further details and external resources."),
  p("Moving inwards, counts of transcripts are shown as scatter plots. The more outer the point, the more transcripts affected by the mutation at that coordinate. The points are 
    both colour and shape coded, green and blue points showing the insertions and deletions, whereas red points show single point mutations. Those SNPs marked by a cross indicate 
    mutations with an associated ClinVar record. Hovering on a point provides more information, and reveals further links to view the genes or transcripts in Ensembl. 
    The tooltips presented when hovering reveal further links,  or save interesting genes in the app as a list to refer back to."),
  p("Finally the inner ribbons represent portions of the genome that have been restructured relative to the Hg19 reference genome, known as structural variants."),
  p("On the right-side of the screen you will see:"),
  tags$ol(
    tags$li("A ", strong("table"), " displaying the most common mutations amongs the donors"),
    tags$li("A ", strong("slinder input "), "to switch between different donors"),
    tags$li("The ", strong('SNP Consequence'), "checkbox group can be used to filter out mutations, by default we've selected only mutations in or around 
    the coding regions of the genome.")
  ),
  br(),
  h4("Video"),
  tags$video(src="genome-viewer.mp4", type = "video/mp4", frameborder = "0", height = "350", controls = NA),
  p(class = "nb", "NB: This mini-app is provided for demonstration purposes only, is unsupported and is utilised at user's risk. If you plan to use this mini-app
    to inform your study, please review the code and ensure you are comfortable with the calculations made before proceeding.")
  )
  
  
  
  
}
