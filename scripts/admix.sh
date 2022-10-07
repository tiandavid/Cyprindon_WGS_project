#!/bin/bash

#SBATCH -p savio
#SBATCH -t 03-00:00
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=davidtian@berkeley.edu

for K in 1 2 3 4 5 6 7 8; \
do
/global/home/users/davidtian/software/admixture_linux-1.3.0/admixture \
--cv /global/scratch/davidtian/joint_vcfs/all_desert_pupfish/plink_binary/ADP_FilteredSNPS_numericChr1_LD.prune_keep.bed $K \
| tee log${K}.out;
done 
