#!/usr/bin/env python

import argparse
parser = argparse.ArgumentParser()
parser.add_argument("-i", "--input", help='a GFF file', dest="input", required=True)
parser.add_argument("-o", "--output", help='Output file with region', dest="output", required=True)

args = parser.parse_args()

import random

entries = []
with open(args.input, 'rt') as f:
    for line in f:
        if line.startswith('##FASTA'):
            break
        elif line.startswith('#'):
            continue
        else:
            if line.strip().split('\t')[6] == '+':
                entries.append(line.strip().split('\t'))
            
region = entries[10]

with open(args.output, 'w') as w:
    w.write('{}:{}-{}'.format(region[0], region[3], region[4]))
