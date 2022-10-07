#!/bin/bash
IND=$1 
FASTQ_FOLDER=$2 
BAM_FOLDER=$3 

echo "trimming adapters for: $IND"

/global/home/users/davidtian/Genome_assembly_pipeline_scripts/TrimGalore-0.6.0/trim_galore --paired --fastqc -o $BAM_FOLDER $FASTQ_FOLDER/${IND}_*R1_001.fastq.gz $FASTQ_FOLDER/${IND}_*R2_001.fastq.gz
#trim_galore --paired --fastqc -o $BAM_FOLDER $FASTQ_FOLDER/${IND}_R1_001.fastq.gz $FASTQ_FOLDER/${IND}_R2_001.fastq.gz
#trim_galore --paired --fastqc -o $BAM_FOLDER $FASTQ_FOLDER/${IND}_R1.fastq.gz $FASTQ_FOLDER/${IND}_R2.fastq.gz

echo "Done with script."
