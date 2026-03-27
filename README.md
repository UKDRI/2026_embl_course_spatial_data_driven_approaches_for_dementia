# Materials for the 2026 EMBL course 'Data-driven approaches to understanding dementia' - spatial transcriptomics tutorial

This tutorial explains the basics of analysing spatial transcriptomics data using the [SpatialData](https://spatialdata.scverse.org/en/stable/) frame work, [Scanpy](https://scanpy.readthedocs.io/en/stable/), and [squidpy](https://squidpy.readthedocs.io/en/stable/). 
The tutorial is split into two parts:
---

Part 1: [part1_introduction_spatialdata_analysis.ipynb](https://github.com/UKDRI/2026_embl_course_spatial_data_driven_approaches_for_dementia/blob/main/part1_introduction_spatialdata_analysis.ipynb)
* Loading data
* SpatialData objects
* Visualising images, segmentation mask, and gene expression
* Image and data coordinate transformations
* Quality control
* Clustering and Marker genes
* Detecting spatially variable genes

In part 1, we are analysing 10x Genomics Xenium data from an Alzheimer's mouse model: [Xenium In Situ Analysis of Alzheimer's Disease Mouse Model Brain Coronal Sections from One Hemisphere Over a Time Course dataset](https://www.10xgenomics.com/datasets/xenium-in-situ-analysis-of-alzheimers-disease-mouse-model-brain-coronal-sections-from-one-hemisphere-over-a-time-course-1-standard), In Situ Gene Expression dataset analyzed using Xenium Onboard Analysis 1.4.0, 10x Genomics (CC BY 4.0 2023, July 13)

---

Part 2: [part2_segmentation_workshop.ipynb](https://github.com/UKDRI/2026_embl_course_spatial_data_driven_approaches_for_dementia/blob/main/part2_segmentation_workshop.ipynb)
* impact of cell segmentation
