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