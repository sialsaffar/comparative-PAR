#!/usr/bin/env python

from Bio import SeqIO
import sys

querySeqs = set(line.rstrip("\n") for line in open(sys.argv[2]))
seqs = SeqIO.parse(open(sys.argv[1]), 'fasta')
SeqIO.write((seq for seq in seqs if seq.id in querySeqs), sys.stdout, 'fasta')

