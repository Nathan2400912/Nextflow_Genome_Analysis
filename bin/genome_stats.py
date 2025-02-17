#!/usr/bin/env python

# You can refer to the help manual by `python genome_stats.py -h`

# argparse is a library that allows you to make user-friendly command line interfaces
import argparse

# here we are initializing the argparse object that we will modify
parser = argparse.ArgumentParser()
parser.add_argument("-i", "--input", help='a FASTA file containing a genomic sequence', dest="input", required=True)
parser.add_argument("-o", "--output", help='The output file where we will write our statistics', dest="output", required=True)

# this method will run the parser and input the data into the namespace object
args = parser.parse_args() 

input_file = args.input

from Bio import SeqIO
from Bio.SeqUtils import gc_fraction

sequence = SeqIO.read(input_file, 'fasta')

gc_content = gc_fraction(sequence.seq)*100

with open(args.output, 'w') as output_file:
    output_file.write(f'GC content: {gc_content:.2f}%\n')
    output_file.write(f'Length of genome: {len(sequence.seq)} bases')
