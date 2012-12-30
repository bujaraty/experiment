#!/usr/bin/python

import sys
import os

print >> sys.stdout, 'This output should go to screen'

if os.path.exists('tmp_stdout'):
    os.remove('tmp_stdout')
sys.stdout = open('tmp_stdout', 'w')
print >> sys.stdout, 'This output should go to file'
sys.stdout.flush()

sys.stdout = sys.__stdout__
print >> sys.stdout, 'I am not sure where this message will go'

