#!/usr/bin/python

import pysam

tabixfile = pysam.Tabixfile("snp137_chr3.txt.gz")

for gtf in tabixfile.fetch('chr3', 110024000, 110040500):
    print gtf




