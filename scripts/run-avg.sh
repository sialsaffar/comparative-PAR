#!/bin/bash

#SBATCH -J avgcov
#SBATCH -p general
#SBATCH -o avgcov_%j.txt
#SBATCH -e avgcov_%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=sialsaff@iu.edu
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=60gb
#SBATCH --time=8:00:00


module load python

python getAvgPerWindow.py $1 >> $2
