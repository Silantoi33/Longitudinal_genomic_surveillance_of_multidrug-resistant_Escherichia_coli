#!/bin/bash
#prefetch
#fastq-dump
#use for loop

for a in $(cat /home/sequser/SILANTOI/miniproject/ecoli-project/echo.txt)
do
fastq-dump --gzip --skip-technical --readids --read-filter pass --dumpbase --split-3 --clip $a
done
