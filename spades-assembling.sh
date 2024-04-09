
find /home/sequser/SILANTOI/miniproject/ecoli-project -name "*_pass_1.fastq.gz" > forward_reads.txt
find /home/sequser/SILANTOI/miniproject/ecoli-project -name "*_pass_2.fastq.gz" > reverse_reads.txt
spades.py --pe1-1 forward_reads.txt --pe1-2 reverse_reads.txt -o output_directory --isolate
