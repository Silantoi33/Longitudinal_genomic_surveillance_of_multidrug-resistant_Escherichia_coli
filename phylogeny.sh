#!/bin/bash

# Change to the directory where sequences are located
cd /home/sequser/SILANTOI/miniproject/ecoli-project/phylogeny

# Concatenate sequences into a single file
cat contigs.fa ERR718783.fasta > combined_sequences.fasta

# Activate mafft environment
source activate mafft

# Align sequences using MAFFT
mafft --auto combined_sequences.fasta > aligned_sequences.fasta

# Deactivate mafft environment
conda deactivate

# Activate raxml environment
source activate raxml

# Run phylogeny construction using RAxML-NG
raxml-ng --all --bs-trees 100 --threads 20 --msa aligned_sequences.fasta --model GTR+G --prefix phylogeny

# Deactivate raxml environment
conda deactivate
