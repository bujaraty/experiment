#!/usr/bin/python

import subprocess;

print 'before'
p = subprocess.Popen('./test_subprocess.sh | hea -3 > ./output.txt', shell=True)
print p.wait()
#args = []
#args.append('./test_subprocess.sh')
#args.append('>')
#args.append('./output.txt')
#subprocess.Popen(args, shell=True)
print 'after'
