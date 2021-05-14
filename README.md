

# GENOME VIEWER

This RShiny mini-app allows you to visualise whole genomes usig Circos, which is a visualisation tool developed for displaying and analysing data from genome sequencing.

This app uses data taken from https://dcc.icgc.org/. Specifically, the data comes from a project led by Sean M. Grimmond and Andrew V. Biankin, who gathered samples of pancreatic adenocarcinoma tumours from various donors. The data from this specific project can be found
https://dcc.icgc.org/repository/icgc/release_19/Projects/PACA-AU.


For more information, you can read the blog about this app at http://www.aridhia.com/blog/beauty-in-simplicity-visualising-large-scale-genomic-data/.

### About the Genome Viewer mini-app

The **Circos-style plot** has a number of layers (from outwards to inwards):

1. Size of chromosomes, moving clockwise, 1 to 22, X and Y; each one displayed in a different colour.
2. Line representation of the number of mutations within a chromosome. When expanded (by clicking in the previous layer), more details are revealed.
3. Scatter plots showing the counts of transcripts. The more outer the point is, the more transcripts are affected by the mutation at that coordinate. The points are both colour and shape coded, green and blue points showing the insertions and deletions, whereas red points show single point mutations. Those SNPs marked by a cross indicate mutations with an associated ClinVar record.
4. Inner ribbons representing portions of the genome that have been restructured relative to the Hg19 reference genome, these are known as structural variants.

This is an interactive plot, if you hover over the different elements, more information will appear.

On the right-side of the screen you will see:
1. A **table** displaying the most common mutations amongst the donors
2. A **slider input** to switch between different donors
4. The **SNP Consequence checkbox** used to filter mutations

#### Checkout and run

You can clone this repository by using the command:

```
git clone https://github.com/aridhia/demo-genome-viewer
```

Open the .Rproj file in RStudio and use `runApp()` to start the app.

#### Deploying to the workspace

1. Create a new mini-app in the workspace called "genome-viewer"" and delete the folder created for it
2. Download this GitHub repo as a .ZIP file, or clone the repository and zip all the files
3. Upload the .ZIP file to the workspace and upzip it inside a folder called "genome-viewer"
4. Run the `dependencies.R` script to install all the packages required by the app
5. Run the app in your workspace

For more information visit https://knowledgebase.aridhia.io/article/how-to-upload-your-mini-app/

