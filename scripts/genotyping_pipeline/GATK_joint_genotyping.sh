#!/bin/bash

#SBATCH -p savio2_bigmem
#SBATCH -t 03-00:00 
#SBATCH --mem=124G
#SBATCH --mail-type=ALL 
#SBATCH --mail-user=davidtian@berkeley.edu
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=2

module load java

java -Xmx124g -jar /global/home/users/davidtian/Genome_assembly_pipeline_scripts/GenomeAnalysisTK.jar -T GenotypeGVCFs -R /global/scratch/davidtian/Cyprinodon_ref/asm.racon.fasta -nt 2 \
--disable_auto_index_creation_and_locking_when_reading_rods \
--variant /global/scratch/davidtian/C_albivelis/CAlb_variants/CYPALBI.raw_variants.g.vcf \
--variant /global/scratch/davidtian/DHP_swiftprep/devilshole_swiftprep_variants/DHP1937.raw_variants.g.vcf \
--variant /global/scratch/davidtian/DHP_swiftprep/devilshole_swiftprep_variants/DHP1940.raw_variants.g.vcf \
--variant /global/scratch/davidtian/DHP_swiftprep/devilshole_swiftprep_variants/DHP1950.raw_variants.g.vcf \
--variant /global/scratch/davidtian/DHP_swiftprep/devilshole_swiftprep_variants/DHP1980-2.raw_variants.g.vcf \
--variant /global/scratch/davidtian/DHP_swiftprep/devilshole_swiftprep_variants/DHP1980-3.raw_variants.g.vcf \
--variant /global/scratch/davidtian/DHP_swiftprep/devilshole_swiftprep_variants/DHP1980-4.raw_variants.g.vcf \
--variant /global/scratch/davidtian/DHP_swiftprep/devilshole_swiftprep_variants/DHP1980-5.raw_variants.g.vcf \
--variant /global/scratch/davidtian/DHP_swiftprep/devilshole_swiftprep_variants/DHP54904.raw_variants.g.vcf \
--variant /global/scratch/davidtian/DHP_swiftprep/devilshole_swiftprep_variants/DHP54910.raw_variants.g.vcf \
--variant /global/scratch/davidtian/DHP_swiftprep/devilshole_swiftprep_variants/DHP54914.raw_variants.g.vcf \
--variant /global/scratch/davidtian/DHP_swiftprep/devilshole_swiftprep_variants/DHP54917.raw_variants.g.vcf \
--variant /global/scratch/davidtian/DHP_swiftprep/devilshole_swiftprep_variants/DHP54918.raw_variants.g.vcf \
--variant /global/scratch/davidtian/C_diabolis/CDia_variants/DHP54903.raw_variants.g.vcf \
--variant /global/scratch/davidtian/C_diabolis/CDia_variants/DHP54907.raw_variants.g.vcf \
--variant /global/scratch/davidtian/C_diabolis/CDia_variants/DHP54908.raw_variants.g.vcf \
--variant /global/scratch/davidtian/C_diabolis/CDia_variants/DHP54909.raw_variants.g.vcf \
--variant /global/scratch/davidtian/C_diabolis/CDia_variants/DHP54911.raw_variants.g.vcf \
--variant /global/scratch/davidtian/C_diabolis/CDia_variants/DHP54913.raw_variants.g.vcf \
--variant /global/scratch/davidtian/C_diabolis/CDia_variants/DHP54920_L008.raw_variants.g.vcf \
--variant /global/scratch/davidtian/C_diabolis/CDia_variants/DHP54920_N2.raw_variants.g.vcf \
--variant /global/scratch/davidtian/C_diabolis/CDia_variants/DIAB080.raw_variants.g.vcf \
--variant /global/scratch/davidtian/C_diabolis/CDia_variants/DIAB54919.raw_variants.g.vcf \
--variant /global/scratch/davidtian/C_eremus/CEre_variants/CYPERE.raw_variants.g.vcf \
--variant /global/scratch/davidtian/C_fontinalis/CFon_variants/CYPFONTCARB.raw_variants.g.vcf \
--variant /global/scratch/davidtian/C_macularius/CMac_variants/CYPMACCOCH17.4.raw_variants.g.vcf \
--variant /global/scratch/davidtian/C_nevadensis_amargosae/CNevAma_variants/CNEVAMA_CHINA_4.3.raw_variants.g.vcf \
--variant /global/scratch/davidtian/C_nevadensis_amargosae/CNevAma_variants/CNEVAMA_TECOPABORE_2.23.raw_variants.g.vcf \
--variant /global/scratch/davidtian/C_nevadensis_amargosae/CNevAma_variants/CNEVAMA_TECOPA_3.16.raw_variants.g.vcf \
--variant /global/scratch/davidtian/C_nevadensis_amargosae/CNevAma_variants/CNEVAMA_VALLEYSPRING_7.19.raw_variants.g.vcf \
--variant /global/scratch/davidtian/C_nevadensis_amargosae/CNevAma_variants/CNevAma.raw_variants.g.vcf \
--variant /global/scratch/davidtian/C_nevadensis_mionectes/CNevMio_variants/CNEVMIO_BIGSPRING.raw_variants.g.vcf \
--variant /global/scratch/davidtian/C_nevadensis_mionectes/CNevMio_variants/POR1.raw_variants.g.vcf \
--variant /global/scratch/davidtian/C_nevadensis_mionectes/CNevMio_variants/POR3.raw_variants.g.vcf \
--variant /global/scratch/davidtian/C_nevadensis_nevadensis/CNevNev_variants/CNEVNEV_SARATOGASPRING_8.22.raw_variants.g.vcf \
--variant /global/scratch/davidtian/C_nevadensis_pectoralis/CNevPec_variants/CNEVPEC_INDIANSPRING.raw_variants.g.vcf \
--variant /global/scratch/davidtian/C_nevadensis_pectoralis/CNevPec_variants/CNEVPEC_SCHOOLSPRING_12.3.raw_variants.g.vcf \
--variant /global/scratch/davidtian/C_nevadensis_shoshone/CNevSho_variants/CNEVSHO_1.23.raw_variants.g.vcf \
--variant /global/scratch/davidtian/C_nevadensis_shoshone/CNevSho_variants/CNEVSHO_HSPRING.6.38.raw_variants.g.vcf \
--variant /global/scratch/davidtian/C_radiosus/CRad_variants/CYPRAD18.1.raw_variants.g.vcf \
--variant /global/scratch/davidtian/C_salinus_milleri/CSalMil_variants/CSALMIL1.raw_variants.g.vcf \
--variant /global/scratch/davidtian/C_salinus_milleri/CSalMil_variants/CSALMIL2.raw_variants.g.vcf \
--variant /global/scratch/davidtian/C_salinus_salinus/CSalSal_variants/CSALSAL1.raw_variants.g.vcf \
--variant /global/scratch/davidtian/C_salinus_salinus/CSalSal_variants/CSALSAL2.raw_variants.g.vcf \
--out /global/scratch/davidtian/joint_vcf/all_desert_pupfish
