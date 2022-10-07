#!/bin/bash

module load bwa
INDS_ALL=()#Individuals
REFERENCE=/global/scratch/davidtian/Cyprinodon_ref/asm.racon.fasta
FASTQ_FOLDER=/global/scratch/davidtian/ADP/trimmed_fastqs
BAM_FOLDER=/global/scratch/davidtian/ADP/bam_aligned

for IND in ${INDS_ALL[@]}; do sbatch -p savio -t 03-00:00 --mem=8G --mail-type=ALL --mail-user=davidtian@berkeley.edu  --wrap "/global/home/users/davidtian/Genome_assembly_pipeline_scripts/fastq_to_ref_alignment_dovetail.sh $IND $FASTQ_FOLDER $BAM_FOLDER"; done
