spades_contigs_file = "$spades_output/contigs.fasta"

with open(spades_contigs_file, 'w') as spades_out:
   for record in SeqIO.parse(velvet_contigs_file, 'fasta'):
       SeqIO.write([record], spades_out, 'fasta')
