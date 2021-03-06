# SeqPipeline
Pipeline for Illumina sequencing runs - fastq-demux-aligments

# Demultiplexing
sample file ("SampleSheet.csv") must contain format like:

```
SampleID,SampleName,I5_Index_ID,index2
BST9LW1,BST9LW1,N502,ATAGAGAG
...
...
```

`module load bcl2fastq`  (default is now 2.20...)

(use --sample-sheet if not default SampleSheet.csv)

`bcl2fastq --run-folder-dir 160414_NB500999_0010_AHLFNLBGXX -p 12 --output-dir 160414_NB500999_0010_AHLFNLBGXX/fastq_files --no-lane-splitting`

# PROCESSING
## Directory structure
 ###  Experiment name   ** e.g. ../../../HOLD1
 ####   ../HOLD1/fastqs   ** (fastqs or symlink to fastqs)
 (  symlink  ln -s ../../../(fastq-dir)/ fastqs
 ####   ../HOLD1/bams
 ####   ../cnts
 
 copy from github 
  align.sh
  runAlign.sh
  HTcnt.sh
  runHTcnt.sh
  makeCountMatrix.sh

# FASTQ - QC
## fastQC
`module load fastqc/0.11.8`

(in interactive node - e.g. 40 CPUs)

(in directory which contains subdirectories of all fastq.gz files)

`mkdir fastq-out`

`fastqc -q -t 39 -o fastq-out */*_L00*_R*fastq.gz`

## MultiQC  (better for overall QC of multiple files - fastq, fastqc, bam, counts...)
`module load python/3.7`

(in root directory, with fastqs, fastQC results,bams, etc...)

`multiqc .`

# ALIGNMENT
(from fastq dir - create names.txt with sample names)

 `ls HO*R1*|sed 's/_R1.*//g' >../names.txt`
 
 align.sh script should have correct run folder and filePath
 ```#Update these if copied from another directory
cd /nfs/rprdata/HOLD/HOLD1/bams
filePath=/nfs/rprdata/HOLD/HOLD1/fastqs
```

Also - make sure that desired index is selected
```
#     hg37
#genomeindex=/nfs/rprdata/Anthony/data/HISAT2_Index/grch38_snp_tran/genome_snp_tran
#    hg19/grch37
genomeindex=/nfs/rprdata/RefGenome/HISAT2/grch37_snp_tran/genome_snp_tran
```

``` mkdir bams
. run.sh
```


