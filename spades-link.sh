#!/bin/bash

# Define paths
READS_DIR="/home/sequser/SILANTOI/miniproject/ecoli-project"
SPAdes_OUTPUT="$READS_DIR/spades_output"
LINKS_OUTPUT="$READS_DIR/links_output"

# Activate SPAdes environment
source activate spades

# Run SPAdes assembly
spades.py -1 "$READS_DIR/*_1.fastq.gz" -2 "$READS_DIR/*_2.fastq.gz" -o "$SPAdes_OUTPUT"

# Deactivate SPAdes environment
conda deactivate

# Activate LINKS environment
source activate links

# Run LINKS for scaffolding
LINKS -f "$SPAdes_OUTPUT/scaffolds.fasta" -s "$READS_DIR/*_1.fastq.gz" -s "$READS_DIR/*_2.fastq.gz" -k 20 -l 500 -t 8 -x 0.1 -a 0.5 -b "$LINKS_OUTPUT"

# Deactivate LINKS environment
conda deactivate
