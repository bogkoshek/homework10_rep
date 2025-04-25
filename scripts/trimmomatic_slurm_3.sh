#!/bin/sh

#SBATCH --job-name=illumina_trimming
#SBATCH --cpus-per-task=8
#SBATCH --mem=20gb
#SBATCH --time=1:00:00
#SBATCH --output=trimmomatic_%j.log
#SBATCH --error=trimmomatic_%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=your_email@example.com
#SBATCH --constraint=hpc
#SBATCH --partition=short

# Активация окружения
source activate trimming

# Выполнение Trimmomaticи
trimmomatic PE -threads 8 -phred33 \
illumina_R1_trimmed_paired_2.fq \
illumina_R2_trimmed_paired_2.fq \
illumina_R1_trimmed_paired_3.fq \
illumina_R1_trimmed_unpaired_3.fq \
illumina_R2_trimmed_paired_3.fq \
illumina_R2_trimmed_unpaired_3.fq \
ILLUMINACLIP:adapters.fa:2:30:10:8:true \
LEADING:25 \
TRAILING:25 \
SLIDINGWINDOW:5:25 \
MINLEN:50 \
HEADCROP:10 \
CROP:200