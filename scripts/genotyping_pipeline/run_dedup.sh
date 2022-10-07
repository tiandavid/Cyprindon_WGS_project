#!/bin/bash

INDS_ALL=(DHP1940 DHP1950 DHP1980-2 DHP1980-3 DHP1980-4 DHP1980-5 DHP54904 DHP54910 DHP54914 DHP54917 DHP54918) #Individuals

BAM_FOLDER_IN=/global/scratch/davidtian/ADP/bam_aligned 
BAM_FOLDER_OUT=/global/scratch/davidtian/ADP/bam_processed
module load java
module load samtools
module load bio/picard/2.9.0 
for IND in ${INDS_ALL[@]}; do sbatch -p savio -t 01-00:00 --mem=24G --mail-type=ALL --mail-user=davidtian@berkeley.edu --wrap "/global/home/users/davidtian/Genome_assembly_pipeline_scripts/sort_dedup_index.sh $IND $BAM_FOLDER_IN $BAM_FOLDER_OUT"; done
