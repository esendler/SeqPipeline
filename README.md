# SeqPipeline
Pipeline for Illumina sequencing runs - fastq-demux-aligments

# Demultiplexing


# FASTQ - QC
## fastQC
'module load fastqc/0.11.8'

(in interactive node - e.g. 40 CPUs)

(in directory which contains subdirectories of all fastq.gz files)

'mkdir fastq-out'

'fastqc -q -t 39 -o fastq-out \*\/\*_L00\*_R\*Fastq.gz'
