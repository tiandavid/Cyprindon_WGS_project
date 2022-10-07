#!/bin/bash

#SBATCH -p savio
#SBATCH -t 03-00:00
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=davidtian@berkeley.edu

module load java 
java -jar /global/home/users/davidtian/Genome_assembly_pipeline_scripts/GenomeAnalysisTK.jar \
    -T VariantFiltration \
    -R /global/scratch/davidtian/Cyprinodon_ref/asm.racon.fasta \
    -V /global/scratch/davidtian/joint_vcfs/all_desert_pupfish/final_variants/ADP_RawINDELS.vcf \
    --filterExpression "QD < 2.0 || FS > 200.0 || ReadPosRankSum < -20.0" \
    --filterName "GATK_indel_filter" \
    -o /global/scratch/davidtian/joint_vcfs/all_desert_pupfish/final_variants/ADP_FilteredINDELS.vcf
