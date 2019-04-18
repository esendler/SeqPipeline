# SeqPipeline
Pipeline for Illumina sequencing runs - fastq-demux-aligments

# Demultiplexing
sample file ("SampleSheet.csv") must contain 
`module load bcl2fastq`  (default is now 2.20...)

(use --sample-sheet if not default SampleSheet.csv)

`bcl2fastq --run-folder-dir 160414_NB500999_0010_AHLFNLBGXX -p 12 --output-dir 160414_NB500999_0010_AHLFNLBGXX/fastq_files --no-lane-splitting`




# FASTQ - QC
## fastQC
`module load fastqc/0.11.8`

(in interactive node - e.g. 40 CPUs)

(in directory which contains subdirectories of all fastq.gz files)

`mkdir fastq-out`

`fastqc -q -t 39 -o fastq-out \*\/\*_L00\*_R\*fastq.gz`

## MultiQC  (better for overall QC of multiple files - fastq, bam, counts...)
