#!/bin/bash

#SBATCH -J bedtools
#SBATCH -p general
#SBATCH -o gencov_%j.txt
#SBATCH -e gencov_%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=sialsaff@iu.edu
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=40gb
#SBATCH --time=8:00:00

module load bedtools

#bedtools genomecov -ibam $1 -d > cov-chrX-female.txt

bedtools coverage -d -a panTro6/chrX-windows.bed -b $1 > cov-chrXwindow-male.txt


