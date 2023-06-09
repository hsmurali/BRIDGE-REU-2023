#!/bin/bash
#SBATCH -J BowTie2 # Job name
#SBATCH -o Bowtie2.o # Name of output file
#SBATCH -e Bowtie2.e # Name of error file
#SBATCH --mail-user=someuser68@umd.edu # Email for job info
#SBATCH --mail-type=all # Get email for begin, end, and fail
#SBATCH --time=01:00:00
#SBATCH --partition=cbcb 
#SBATCH --account=cbcb 
#SBATCH --ntasks=16
#SBATCH --qos=high
#SBATCH --mem=32gb

module load bowtie2/2.4.1
module load samtools/1.16

READS_1=/fs/cbcb-scratch/hsmurali/REU_2023/Reads/MET0319_R1.fastq.gz
READS_2=/fs/cbcb-scratch/hsmurali/REU_2023/Reads/MET0319_R2.fastq.gz
REF=/fs/cbcb-scratch/hsmurali/REU_2023/GCA_000025765.1_ASM2576v1_genomic.fna
OUT_DIR=/fs/cbcb-scratch/someuser68/REU_2023_Test/
mkdir ${OUT_DIR}
IDX=${OUT_DIR}GCA_000025765.1_ASM2576v1_genomic.idx

##BUILD A BOWTIE2 INDEX
bowtie2-build ${REF} ${IDX}

#ALIGN READS TO REFERENCE
/usr/bin/time -v bowtie2 -p 16 -x ${IDX} -U ${READS_1},${READS_2} --no-unal | samtools view -bS > ${OUT_DIR}/alignments.bam
