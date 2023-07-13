#!/bin/bash

#SBATCH --job-name=mapping_reference
#SBATCH --output=mapping_reference.log
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=2
#SBATCH -A molecolb
#SBATCH -p molecolb
#SBATCH --mem-per-cpu=8GB
#SBATCH --time=24:00:00
#SBATCH --mail-type=all
#SBATCH --mail-user=g.gouws@sheffield.ac.uk

# Load Genomics software repository
source /usr/local/community/Genomics/.bashrc

# Navigate to working directory
cd /mnt/fastdata/bi1gg/omnic

# Create a aligned directory to receive output

# Use bwa mem to map the paired reads to the indexed genome
bwa mem -5 -P -S -T0 -t20 reference/index 30044_10.asm.bp.p_ctg.fasta \
raw_data/Oceanic_Cricket_OmniC-S1_L001_R1_001.fastq.gz raw_data/Oceanic_Cricket_OmniC-S1_L001_R2_001.fastq.gz \
-o aligned/Oceanic_cricket_mapped.sam
