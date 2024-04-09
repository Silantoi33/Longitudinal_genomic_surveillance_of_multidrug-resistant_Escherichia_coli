import matplotlib.pyplot as plt

# File path to the coordinate file
coords_file = "mummer_output.coords"

# Initialize lists to store coordinates
ref_starts = []
ref_ends = []
query_starts = []
query_ends = []

# Read coordinates from the file, skipping header lines
with open(coords_file, "r") as file:
    # Skip header lines
    for line in file:
        if line.startswith("NUCMER"):
            break

    # Read the coordinate data
    for line in file:
        fields = line.split()
        if len(fields) < 8 or not fields[0].isdigit():
            continue  # Skip lines that don't contain valid coordinate data
        ref_start = int(fields[0])
        ref_end = int(fields[1])
        query_start = int(fields[3])
        query_end = int(fields[4])
        ref_starts.append(ref_start)
        ref_ends.append(ref_end)
        query_starts.append(query_start)
        query_ends.append(query_end)

# Plot the alignment
plt.plot(ref_starts, query_starts, "bo", label="Alignment")
plt.xlabel("Reference Genome")
plt.ylabel("Contigs")
plt.title("Alignment between Contigs and Reference Genome")
plt.legend()
plt.show()
