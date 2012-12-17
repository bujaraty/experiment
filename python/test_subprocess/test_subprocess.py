#!/usr/bin/python

import subprocess;

print 'before'
subprocess.Popen('./test_subprocess.sh | head -3 > ./output.txt', shell=True)
#args = []
#args.append('./test_subprocess.sh')
#args.append('>')
#args.append('./output.txt')
#subprocess.Popen(args, shell=True)
print 'after'
