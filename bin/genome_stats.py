#!/usr/bin/env python

import argparse
parser = argparse.ArgumentParser()
parser.add_argument("-i", "--input", help='a FASTA file containing a genomic sequence', dest="input", required=True)
parser.add_argument("-o", "--output", help='The output file where we will write our statistics', dest="output", required=True)

args = parser.parse_args() 

input_file = args.input

from Bio import SeqIO
from Bio.SeqUtils import gc_fraction

sequence = SeqIO.read(input_file, 'fasta')

gc_content = gc_fraction(sequence.seq)*100

with open(args.output, 'w') as output_file:
    output_file.write(f'GC content: {gc_content:.2f}%\n')
    output_file.write(f'Length of genome: {len(sequence.seq)} bases')
