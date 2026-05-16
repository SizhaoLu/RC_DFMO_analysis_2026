# RC_DFMO_analysis_2026

Analysis code for bulk and single-cell RNA-seq data processing, differential gene expression, and pathway activity scoring supporting the study:

**"Anti-Polyamine Therapy Restrains Kidney Cyst Growth in an Orthologous Mouse Model of Autosomal Dominant Polycystic Kidney Disease"**

---

## Overview

This repository contains the Python and R scripts used to process RNA-seq data and reproduce the figures in the manuscript. Raw and processed data are deposited separately on Zenodo (see [Data Availability](#data-availability)).

---

## Repository Structure

```
RC_DFMO_analysis_2026/
├── notebooks/
│   ├── data_processing.ipynb			# Bulk RNA-seq processing and DEG analysis
│   ├── Figure.ipynb     			# Reproducing the figure
│   ├── CIBERSORTx_data_processing.ipynb      	# Reference data preparation for CIBERSORTx
│   ├── convert_h5ad.R				# Converting rds to h5ad
│   └── R_plotting.R				# Plotting scatter plot with select labels
├── tables/                   			# see Zenodo for tables
└── README.md
```

---

## Data Availability

Raw and processed data tables are deposited on Zenodo:

> [10.5281/zenodo.20128142](https://doi.org/10.5281/zenodo.20128142)

Input files expected by the scripts should be placed in the `tables/` directory.

---

## License

This code is released under the [MIT License](LICENSE).
