#!/bin/bash

#SBATCH -J fastqc
#SBATCH -p general
#SBATCH -o fastqc_%j.txt
#SBATCH -e fastqc_%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=sialsaff@iu.edu
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=20gb
#SBATCH --time=8:00:00


module load fastqc

#fastqc SRR20006579_1.fastq.gz
#wait
#fastqc SRR20006579_2.fastq.gz

#wait

fastqc SRR20006582_1.fastq.gz
wait
fastqc SRR20006582_2.fastq.gz

