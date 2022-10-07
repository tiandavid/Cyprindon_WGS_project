#!/bin/bash

#SBATCH -p savio
#SBATCH -t 03-00:00
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=davidtian@berkeley.edu

module load bio/vcftools/0.1.15
vcftools --vcf /global/scratch/davidtian/joint_vcfs/all_desert_pupfish/GATK_filter/ADP_FilteredSNPS.passing.vcf \
         --bed /global/home/users/davidtian/Genome_assembly_pipeline_scripts/SNPable/SNPable_mapped_mask.bed \
         --recode \
         --recode-INFO-all \
         --out ADP_FilteredSNPS_passing_SNPableMask
