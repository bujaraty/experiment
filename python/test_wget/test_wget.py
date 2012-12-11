#!/usr/bin/python

import subprocess
import os

real_working_dir = os.getcwd()

print 'current working dir: ', os.getcwd()

os.chdir('/home/jessada/tmp')
print 'current working dir: ', os.getcwd()

args = []
args.append('wget')
args.append('-q')
args.append('-N')
args.append('http://www.openbioinformatics.org/annovar/download/hg19_ljb_lrt.txt.idx.gz')
subprocess.call(args)



os.chdir(real_working_dir)
print 'current working dir: ', os.getcwd()

args = []
args.append('wget')
args.append('-q')
args.append('-N')
args.append('http://www.openbioinformatics.org/annovar/download/hg19_ljb_sift.txt.idx.gz')
subprocess.call(args)
#args = []
#args.append('wget')
#args.append('-N')
##args.append('--output-document=/home/jessada/tmp/hg19_ljb_lrt.txt.idx.gz')
#args.append('http://www.openbioinformatics.org/annovar/download/hg19_ljb_lrt.txt.idx.gz')
#
#
##subprocess.call(['wget', '-q', '--output-document=/home/jessada/tmp/apartment.html', 'http://www.sssb.se/index.php?page=overview_eng'])
#subprocess.call(args)
