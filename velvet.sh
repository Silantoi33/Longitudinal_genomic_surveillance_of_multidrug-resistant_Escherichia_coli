#!/bin/bash

# Activate Conda environment
source activate velvet

# Define input directory and output directory
INPUT_DIR="/home/sequser/SILANTOI/miniproject/ecoli-project"
OUTPUT_DIR="ASSEMBLED"
KMER_SIZE=31

# Step 1: Run velveth
echo "Running velveth..."
for file in $INPUT_DIR/*_1.fastq.gz; do
    base_name=$(basename $file _1.fastq.gz)
    velveth $OUTPUT_DIR $KMER_SIZE -fastq.gz \
        $INPUT_DIR/${base_name}_1.fastq.gz $INPUT_DIR/${base_name}_2.fastq.gz
done

# Step 2: Run velvetg
echo "Running velvetg..."
velvetg $OUTPUT_DIR -scaffolding no

echo "Velvet assembly completed!"

# Deactivate Conda environment
conda deactivate
