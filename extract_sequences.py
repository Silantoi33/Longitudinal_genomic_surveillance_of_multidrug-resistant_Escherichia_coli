sequences = {}

with open("assembly.gfa", "r") as gfa_file:
    for line in gfa_file:
        if line.startswith("S"):
            fields = line.strip().split("\t")
            seq_id = fields[1]
            sequence = fields[2]
            sequences[seq_id] = sequence

# Write assembled sequences to FASTA file
with open("assembly.fasta", "w") as fasta_file:
    for seq_id, sequence in sequences.items():
        fasta_file.write(">" + seq_id + "\n")
        fasta_file.write(sequence + "\n")
