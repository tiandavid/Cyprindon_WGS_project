#!/bin/bash

module load cutadapt/2.4
module load fastqc

INDS_ALL=() #Individual IDs
RAW_FASTQ_FOLDER=/global/scratch/davidtian/ADP/raw_fastqs
TRIM_FASTQ_FOLDER=/global/scratch/davidtian/ADP/trimmed_fastqs


for IND in ${INDS_ALL[@]}; do sbatch -p savio -t 03-00:00 --mem=8G --mail-type=ALL --mail-user=davidtian@berkeley.edu  --wrap "/global/home/users/davidtian/Genome_assembly_pipeline_scripts/trim_raw_fastqs.sh $IND $RAW_FASTQ_FOLDER $TRIM_FASTQ_FOLDER"; done
