 #!/usr/share/perl

  use strict;
  use warnings;
  use Time::Piece;

  my $din  = "/pathToFastq/";          # path to fastQ files
  my $dout = "/pathToTrimmedFiles/";   # path where trimmed files are to be stored

  my $startTime = localtime;

  opendir(DIR, $din) or die "Error in opening dir $din\n";

  while (my $fin = readdir(DIR))
  {
		# list files only(and not directories)
		# use a regular expression to find files ending in .fastq
		next unless ((-f "$din/$fin") && ($fin =~ m/\.fastq.gz$/));

		my $INPUT_FILE = join("", $din, $fin);                          # current input filename and path
		my($finNameNoExtension) = split("\.fastq.gz", $fin);            # remove extension from input file
		my $fout = join("_", $finNameNoExtension, "trimmed.fastq.gz");	# append trimmed.fastq extension
		my $OUTPUT_FILE = join("", $dout, $fout); 			# current output filename and path

		# execute trimmomatic command for each input file
		my $trimmomatic = "java -jar trimmomatic-0.33.jar SE $INPUT_FILE  $OUTPUT_FILE ILLUMINACLIP:TruSeq3-SE.fa:2:30:10 CROP:50 MINLEN:40";
		system($trimmomatic);
		print("fin\n");
  }

  closedir(DIR);

  # print run summary
  my $stopTime = localtime;
  print "Trimmomatic finished.!\n";
  print "Trimmomatic started at: $startTime\n";
  print "Trimmomatic finished at: $stopTime\n";

  exit 0;
