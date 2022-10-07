#!/bin/bash

#SBATCH --account=co_rosalind
#SBATCH --job-name=fst
#SBATCH --partition=savio
#SBATCH --nodes=1
#SBATCH --time=03-00:00
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=davidtian@berkeley.edu

module load bio/vcftools/0.1.15
#calculate Weir FST
vcftools --vcf /clusterfs/fishes/david/scratch/Paper1_DHP/joint_vcfs/all_desert_pupfish/GATK_filter/ADP_FilteredSNPS.passing.SNPableMask.tmpID.reheader.minDP3.maxDP315.minGQ20.genorate0.5.maf0.05.vcf \
--weir-fst-pop final.nev.txt \
--weir-fst-pop all.good.DHP.txt	\
--out /clusterfs/fishes/david/scratch/Paper1_DHP/FST/final.allgoodDHP.vs.final.nev
