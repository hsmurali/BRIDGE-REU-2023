#!/bin/bash
#SBATCH -J Minimap2 # Job name
#SBATCH -o Minimap2.o # Name of output file
#SBATCH -e Minimap2.e # Name of error file
#SBATCH --mail-user=<user-name>@terpmail.umd.edu # Email for job info
#SBATCH --mail-type=all # Get email for begin, end, and fail
#SBATCH --time=01:00:00
#SBATCH --partition=cbcb 
#SBATCH --account=cbcb 
#SBATCH --ntasks=16
#SBATCH --qos=high
#SBATCH --mem=32gb

module load conda
source activate /fs/cbcb-software/RedHat-7-x86_64/users/hsmurali/venvs/Minimap2

READS_1=/fs/cbcb-scratch/hsmurali/REU_2023/Reads/MET0319_R1.fastq.gz
READS_2=/fs/cbcb-scratch/hsmurali/REU_2023/Reads/MET0319_R2.fastq.gz
REF=/fs/cbcb-scratch/hsmurali/REU_2023/GCA_000025765.1_ASM2576v1_genomic.fna
OUT_DIR=/fs/cbcb-scratch/hsmurali/REU_2023_Test/

/usr/bin/time -v minimap2 -t 16 ${REF} ${READS_1}  > ${OUT_DIR}/READS_1_Minimap2.paf
/usr/bin/time -v minimap2 -t 16 ${REF} ${READS_2}  > ${OUT_DIR}/READS_2_Minimap2.paf
