# trim-adapters

## `trim039-truseq-se.py`
This is a simple Python 3 script to automate the process of [trimming Illumina TruSeq adapter sequences](https://support.illumina.com/bulletins/2016/04/adapter-trimming-why-are-adapter-sequences-trimmed-from-only-the--ends-of-reads.html) from single-end reads using the command-line tool [__Trimmomatic (v0.39)__](http://www.usadellab.org/cms/?page=trimmomatic) (Bolger, A. M., Lohse, M., & Usadel, B. (2014)).

Given a directory containing fastq files, the script will execute __Trimmomatic__ on each file and rename the trimmed file with a `trimmed.fastq.gz` extension.

Usage: `python trim039-truseq-se.py inputdir outputdir --adapters --minlen`
- `inputdir` (required): path to __fastq__ files
- `outputdir` (required): path to directory where trimmed files will be stored
- `--adapters` (optional): __fasta__ file containing adapters to be searched and trimmed. If not given, will default to `TruSeq3-SE.fa`
-   `--minlen` (optional): specifies the `MINLEN` parameter, which is the minimum length a __*trimmed*__ read must have in order to be kept. If not given, will default to 40.

NOTES:
- the script will additionally generate a log file of the session and store it in `outputdir`
- the script assumes the binary file `trimmomatic` and adapter file `TruSeq3-SE.fa` are in the PATH environment.
-
## `trim-truseq-se.pl`
This is a Perl script that performs the same task as the Python script above, but using Trimmomatic v0.33, instead of v0.39. The Python version supersedes the Perl script and is the preferred one to use.

To use, edit `trim-truseq-se.pl` and
- provide the path to __fastq__ files to the variable `din`
- provide the path where trimmed files will be stored to the variable `dout`
- run `perl trim-truseq-se.pl` on command-line

NOTES:
- assumes the binary `trimmomatic-0.33.jar` file is in the PATH
- assumes the files containing sequences to be searched and trimmed (`TruSeq2*.fa` or `TruSeq3*.fa`, where * is a wildcard character) are in the same path as the binary. These files are distributed with __Trimmomatic__ and may be slightly differently named depending on the version of __Trimmomatic__. It is also possible to define a fasta file containing custom sequences to be trimmed.
