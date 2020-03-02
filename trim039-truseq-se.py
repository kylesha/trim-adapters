#!/usr/bin/env python3
import argparse, os

parser = argparse.ArgumentParser()
parser.add_argument("inputdir", help="input directory for (untrimmed) fastq files")
parser.add_argument("outputdir", help="output directory for trimmed fastq files")
parser.add_argument("--adapters", help="FASTA file of adapters to search and trim", default = "TruSeq3-SE.fa")
parser.add_argument("--minlen", help="minimum read length (after trimming) for a read to be kept", default = "40")
args = parser.parse_args()

for file in os.listdir(args.inputdir):
    if file.endswith("fastq.gz") or file.endswith("fastq"):
        run_trim = ' '.join([
        "trimmomatic",
        "SE",
        ' '.join(["-trimlog", os.path.join(args.outputdir, "trimlog.txt")]),
        os.path.join(args.inputdir, file),
        os.path.join(args.outputdir, os.path.join(args.outputdir, file.replace("fastq.gz", "trimmed.fastq.gz"))),
        ':'.join(["ILLUMINACLIP",args.adapters, "2:30:10"]),
        ':'.join(["MINLEN", args.minlen])
        ])
        os.system(run_trim)
