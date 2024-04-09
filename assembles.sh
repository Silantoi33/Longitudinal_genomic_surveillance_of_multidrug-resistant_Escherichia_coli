#!/bin/bash

# Create output directory
mkdir -p assembled_reads

# Function to check if both R1 and R2 files exist and assemble them
assemble_reads() {
    if [ -e "$1" ] && [ -e "$2" ]; then
        echo "Assembling $1 and $2..."
        spades.py -1 "$1" -2 "$2" -o assembled_reads
    else
        echo "One or both of the files $1 and $2 are missing. Skipping assembly."
    fi
}

# Assemble each pair of reads
assemble_reads "ERR775884_pass_1.fastq.gz" "ERR775884_pass_2.fastq.gz"
assemble_reads "ERR775888_pass_1.fastq.gz" "ERR775888_pass_2.fastq.gz"
assemble_reads "ERR775890_pass_1.fastq.gz" "ERR775890_pass_2.fastq.gz"
assemble_reads "ERR775891_pass_1.fastq.gz" "ERR775891_pass_2.fastq.gz"
assemble_reads "ERR775894_pass_1.fastq.gz" "ERR775894_pass_2.fastq.gz"
assemble_reads "ERR775898_pass_1.fastq.gz" "ERR775898_pass_2.fastq.gz"
assemble_reads "ERR775902_pass_1.fastq.gz" "ERR775902_pass_2.fastq.gz"
assemble_reads "ERR775904_pass_1.fastq.gz" "ERR775904_pass_2.fastq.gz"
assemble_reads "ERR775906_pass_1.fastq.gz" "ERR775906_pass_2.fastq.gz"
assemble_reads "ERR775999_pass_1.fastq.gz" "ERR775999_pass_2.fastq.gz"

echo "Assembly complete."
