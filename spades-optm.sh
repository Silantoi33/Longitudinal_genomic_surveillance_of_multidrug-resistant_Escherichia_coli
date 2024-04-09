#!/bin/bash

# Define variables
CONTOIGS_FILE="/home/sequser/SILANTOI/miniproject/ecoli-project/ASSEMBLED/contigs.fa"
OUTPUT_DIR="/home/sequser/SILANTOI/miniproject/ecoli-project/ASSEMBLED/spades_output"

# Run SPAdes
spades.py -s "$CONTOIGS_FILE" -o "$OUTPUT_DIR"
