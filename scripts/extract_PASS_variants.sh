#!/bin/bash

#SBATCH -p savio
#SBATCH -t 03-00:00
#SBATCH --mem=32G
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=davidtian@berkeley.edu

module load java 
java -Xmx32g -jar /global/home/users/davidtian/Genome_assembly_pipeline_scripts/GenomeAnalysisTK.jar \
        -R /global/scratch/davidtian/Cyprinodon_ref/asm.racon.fasta \
        -T SelectVariants \
        -V /global/scratch/davidtian/joint_vcfs/all_desert_pupfish/ADP_FilteredSNPS.vcf -ef \
        -o /global/scratch/davidtian/joint_vcfs/all_desert_pupfish/ADP_FilteredSNPS.passing.vcf
