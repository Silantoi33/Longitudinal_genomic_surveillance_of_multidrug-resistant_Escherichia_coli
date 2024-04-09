import gzip

def split_paired_fastq(input_file, output_prefix, batch_size):
    with open(input_file, 'r') as f:
        r1_output_file = gzip.open(f"{output_prefix}_R1.fastq.gz", 'wt')
        r2_output_file = gzip.open(f"{output_prefix}_R2.fastq.gz", 'wt')
        r1_count = 0
        r2_count = 0

        for line in f:
            if r1_count < batch_size and r2_count < batch_size:
                if line.startswith("@"):
                    if "/1" in line:
                        r1_count += 1
                        output_file = r1_output_file
                    elif "/2" in line:
                        r2_count += 1
                        output_file = r2_output_file
                output_file.write(line)

        r1_output_file.close()
        r2_output_file.close()

# Example usage:
split_paired_fastq("/home/sequser/SILANTOI/miniproject/ecoli-project/ERR718783.fastq", "/home/sequser/SILANTOI/miniproject/ecoli-project/ERR718783", 10000)
