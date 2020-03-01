# trim-adapters

## `trim-truseq-se.pl`

This is a Perl script that automates the process of [trimming Illumina TruSeq adapter sequences](https://support.illumina.com/bulletins/2016/04/adapter-trimming-why-are-adapter-sequences-trimmed-from-only-the--ends-of-reads.html) from single-end reads using the command-line tool [__Trimmomatic__](http://www.usadellab.org/cms/?page=trimmomatic) (Bolger, A. M., Lohse, M., & Usadel, B. (2014)). Given a directory containing fastQ files, the script will execute __Trimmomatic__ on each file and rename the trimmed file with a `trimmed.fastq.gz` extension.

To use, edit `trim-truseq-se.pl` and
- provide the path to `fastq.gz` files to the variable `din`
- provide the path where trimmed files will be stored to the variable `dout`
- run `perl trim-truseq-se.pl` on command-line

NOTES:
- this script uses `Trimmomatic v0.33`
- assumes the binary `trimmomatic-0.33.jar` file is in the PATH
- assumes the files containing sequences to be searched and trimmed (`TruSeq2*.fa` or `TruSeq3*.fa`, where * is a wildcard character) are in the same path as the binary. These files are distributed with __Trimmomatic__ and may be slightly differently named depending on the version of __Trimmomatic__. It is also possible to define a fasta file containing custom sequences to be trimmed.

Note that __Trimmomatic__ is a powerful tool with many parameters. The specific use case defined in `trim-truseq-se.pl` will
- search and trim sequences present in the file `TruSeq3-SE.fa`
- crop reads (regardless of base quality) to 50 bases long (`CROP:50`)
- keep only trimmed reads that are 40 bases or longer (`MINLEN:40`)
