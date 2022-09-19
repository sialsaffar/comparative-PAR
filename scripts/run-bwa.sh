#!/bin/bash

#SBATCH -J bwa-mem2
#SBATCH -p general
#SBATCH -o bwa-mem2_%j.txt
#SBATCH -e bwa-mem2_%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=sialsaff@iu.edu
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=6
#SBATCH --mem=80gb
#SBATCH --time=48:00:00

module load samtools/1.9

./bwa-mem2/bwa-mem2.avx2 mem -t 6 panTro6/panTro6.fa SRR20006582_1.fastq.gz SRR20006582_2.fastq.gz | samtools sort -@6 -o male-chimp.bam -

#wait

#samtools index male-chimp.bam 
