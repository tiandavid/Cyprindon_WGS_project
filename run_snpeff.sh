#!/bin/bash

#SBATCH --account=ac_fishes
#SBATCH --job-name=snpeff  
#SBATCH --partition=savio
#SBATCH --nodes=1
#SBATCH --time=03-00:00
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=davidtian@berkeley.edu   

module load java 

java -Xmx8g -jar /global/scratch/davidtian/snpEff/snpEff.jar Cbro /global/scratch/davidtian/joint_vcfs/all_desert_pupfish/GATK_filter/ADP_FilteredSNPS.passing.SNPableMask.tmpID.reheader.minDP3.maxDP315.minGQ20.genorate0.5.maf0.05.vcf.gz > ADP_FilteredSNPS.passing.SNPableMask.tmpID.reheader.minDP3.maxDP315.minGQ20.genorate0.5.maf0.05.snpeff.vcf
