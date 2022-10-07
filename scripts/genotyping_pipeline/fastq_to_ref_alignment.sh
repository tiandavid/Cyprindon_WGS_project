#!/bin/bash

IND=$1 #Cbyt150
FASTQ_FOLDER=$2 #seqdata/trimmed_fastq
BAM_FOLDER=$3 #seqdata/bam_aligned

echo "Aligning fastq files to reference genome for: $IND"

#bwa mem /proj/cmarlab/users/emilie/Cyprinodon_ref/jeremy_align/asm.racon.fasta -aM -t 8 -R "@RG\tID:group1\tSM:$IND\tPL:illumina\tLB:lib1" $FASTQ_FOLDER/${IND}_R1_001.fastq.gz $FASTQ_FOLDER/${IND}_R2_001.fastq.gz > $BAM_FOLDER/$IND.sam
bwa mem /global/scratch/davidtian/Cyprinodon_ref/asm.racon.fasta -aM -t 8 -R "@RG\tID:group1\tSM:$IND\tPL:illumina\tLB:lib1"\
$FASTQ_FOLDER/${IND}*_R1_*_val_1.fq.gz $FASTQ_FOLDER/${IND}*_R2_*_val_2.fq.gz > $BAM_FOLDER/$IND.sam
echo "Done with script."
