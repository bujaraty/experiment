#!/usr/bin/python

import subprocess;

print 'before'
subprocess.call('./test_subprocess.sh')
print 'after'
