#!/usr/bin/python

import zipfile
import os.path
zfile = zipfile.ZipFile("/home/jessada/development/experiment/python/test_zip/test_zip.zip")
#dirname = '/home/jessada/development/experiment/python/test_zip/'
for name in zfile.namelist():
    print name
    (dirname, filename) = os.path.split(name)
    print "Decompressing " + filename + " on " + dirname
    fd = open(name,"w")
    fd.write(zfile.read(name))
    fd.close()


