

# GENOME VIEWER

This RShiny mini-app allows you to visualise whole genomes usig Circos. Circos is a visualisation tool developed for displaying and analysing data from genome sequencing.

This app uses data taken from https://dcc.icgc.org/. Specifically, the data comes from a project led by Sean M. Grimmond and Andrew V. Biankin, who gathered samples of pancreatic adenocarcinoma tumours from various donors. The data from this specific project can be found
https://dcc.icgc.org/repository/icgc/release_19/Projects/PACA-AU.


For more information, you can read the blog about this app at http://www.aridhia.com/blog/beauty-in-simplicity-visualising-large-scale-genomic-data/.   

#### Checkout and run

You can clone this repository by using the command:

```
git clone https://github.com/aridhia/demo-genome-viewer
```

Open the .Rproj file in RStudio and use `runApp()` to start the app.

#### Deploying to the workspace

1. Create a new mini-app in the workspace called "genome-viewer"" and delete the folder created for it
2. Download this GitHub repo as a .ZIP file, or zip all the files
3. Upload the .ZIP file to the workspace and upzip it inside a folder called "genome-viewer"
4. Run the app in your workspace

