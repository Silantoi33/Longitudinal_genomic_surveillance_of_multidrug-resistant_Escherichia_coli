import gzip

def split_paired_fastq(input_file, output_prefix, batch_size):
    with open(input_file, 'r') as f:
        current_batch = 0
        r1_output_file = None
        r2_output_file = None
        r1_batch_count = 0
        r2_batch_count = 0

        for line in f:
            if r1_batch_count == 0:
                current_batch += 1
                r1_output_file = gzip.open(f"{output_prefix}_R1_{current_batch}.fastq.gz", 'wt')
                r2_output_file = gzip.open(f"{output_prefix}_R2_{current_batch}.fastq.gz", 'wt')

            if r1_batch_count < 4 * batch_size:
                r1_output_file.write(line)
                r1_batch_count += 1
            else:
                r2_output_file.write(line)
                r2_batch_count += 1

            if r1_batch_count == 4 * batch_size:
                r1_output_file.close()
                r1_batch_count = 0
            elif r2_batch_count == 4 * batch_size:
                r2_output_file.close()
                r2_batch_count = 0

        if r1_output_file:
            r1_output_file.close()
        if r2_output_file:
            r2_output_file.close()

# Example usage:
split_paired_fastq("/home/sequser/SILANTOI/miniproject/ecoli-project/ASSEMBLED/ERR718783.fastq", "/home/sequser/SILANTOI/miniproject/ecoli-project/ASSEMBLED/ERR718783", 10000)
