#!/bin/bash

INDS_ALL=() #Individuals

VARIANT_OUTPUT=/global/scratch/davidtian/ADP/DHP_variants
BAM_FOLDER=/global/scratch/davidtian/ADP/bam_processed
module load samtools
 
for IND in ${INDS_ALL[@]}; do sbatch -p savio_bigmem -t 03-00:00 --mem=500G --mail-type=ALL --mail-user=davidtian@berkeley.edu --wrap "/global/home/users/davidtian/Genome_assembly_pipeline_scripts/variant_disc.sh $IND $BAM_FOLDER $VARIANT_OUTPUT"; done
