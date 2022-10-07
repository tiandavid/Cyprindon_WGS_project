#!/bin/bash

IND=$1 
BAM_FOLDER=$2
VARIANT_OUTPUT=$3

echo "$IND"
java -Xmx500g -jar /global/home/users/davidtian/Genome_assembly_pipeline_scripts/GenomeAnalysisTK.jar \
-T HaplotypeCaller \
-R /global/scratch/davidtian/Cyprinodon_ref/asm.racon.fasta \
-I $BAM_FOLDER/$IND.dedup.bam \
--genotyping_mode DISCOVERY \
--emitRefConfidence GVCF -mmq 5 -nct 20 -o $VARIANT_OUTPUT/$IND.raw_variants.g.vcf
