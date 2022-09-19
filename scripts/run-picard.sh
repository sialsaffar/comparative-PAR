#!/bin/bash

#SBATCH -J picard
#SBATCH -p general
#SBATCH -o picard_%j.txt
#SBATCH -e picard_%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=sialsaff@iu.edu
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=40gb
#SBATCH --time=8:00:00


module load java

java -jar picard.jar CollectMultipleMetrics \
I=$1 \
O=multiple_metrics-male-chrX.txt \
R=panTro6/panTro6.fa

wait 

java -jar picard.jar CollectWgsMetrics \
I=$1 \
O=collect_wgs_metrics-male-chrX.txt \
R=panTro6/panTro6.fa

wait

java -jar picard.jar CollectAlignmentSummaryMetrics \
I=$1 \
O=alignment_summary-male-chrX.txt
R=panTro6/panTro6.fa

wait

java -jar picard.jar MarkDuplicates \
I=$1 \
O=mkdup_male-chimp.bam \
M=mkdup_metrics-male-chrX.txt


