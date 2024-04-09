#!/bin/bash

# Path to the directory containing contigs.fa
contigs_dir="/home/sequser/SILANTOI/miniproject/ecoli-project/ASSEMBLED"

# Output directory for Prokka results
prokka_output_dir="/home/sequser/SILANTOI/miniproject/ecoli-project/ASSEMBLED/prokka_spt"

# Check if seqkit is installed
if ! command -v seqkit &> /dev/null; then
    echo "Error: seqkit is not installed or not in PATH"
    exit 1
fi

# Activate Prokka environment
source activate prokka

# Split contigs.fa into individual files
cd "$contigs_dir" || exit
seqkit split2 --by-part 1 --out-dir "$contigs_dir" contigs.fa

# Annotate each contig using Prokka
for file in contigs_*.fa; do
    if [[ -s "$file" ]]; then
        output_dir="$prokka_output_dir/annotations_${file%.fa}"
        mkdir -p "$output_dir"
        prokka --outdir "$output_dir" --force "$file"
    else
        echo "Error: $file is not a readable non-empty FASTA file"
    fi
done
