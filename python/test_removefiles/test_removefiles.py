#!/usr/bin/python

#import datetime, time;
import os
import shutil

for file_name in os.listdir('tmp'):
    print file_name
    shutil.rmtree(file_name)
