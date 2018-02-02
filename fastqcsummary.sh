#!/bin/bash

#This is a script that will analyze fastq files with the program fastqc and makes a table called "newtable.txt" with a summary of the results
#To execute this program fastqc needs to be installed 
#This program should be executed while you are in the directory containing the fastq files

fastqc *.fastq #all fastq files in the directory are analyzed with fastQC

unzip \*.zip #the output files of fastqc are unzipped 

paste */sum*.txt > allsummaries.txt #this copies the summaries of every analysis into one new file. 

cut -f 1,4,7,10,13,16,19,22,25,28,31,34,37,40,43,46,49,51,54 allsummaries.txt> passandfail.txt #this cuts the columns stating whether the sequence has passed or failed certain criteria

cut -f 2 allsummaries.txt >> Column1.txt #this cuts the criteria which can be passed or failed to a new file
paste Column1.txt passandfail.txt > table.txt #this combines the criteria and pass and fail columns. 
head -1 allsummaries.txt | cut -f 1,3,6,9,12,15,18,21,24,27,30,33,36,39,42,45,48,51,54,57 > header.txt #this creates the header

cat header.txt table.txt > newtable.txt #this combines the header and the table into one new file. 

