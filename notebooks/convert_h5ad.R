# R script for converting rds file from https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE268494
library(Matrix)
library(anndata) 
mat <- readRDS('GSE268494_PKDaggr_GEO_count_RNA.rds')
adata <- AnnData(X = t(mat))
adata$write_h5ad('pkd_Humphreys_mus/GSE268494_PKDaggr_GEO_count_RNA.h5ad')
