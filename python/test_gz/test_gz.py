#!/usr/bin/python

import gzip
import os.path
f = gzip.open("/home/jessada/development/experiment/python/test_gz/test_gz.txt.gz")
content = f.read()
#f.write("/home/jessada/development/experiment/python/test_gz/test_gz.txt")
f.close()

for line in content:
    print line

