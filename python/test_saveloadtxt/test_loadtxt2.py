#!/usr/bin/python

import numpy as np

#y = np.asmatrix(np.loadtxt('test_dataset', delimiter='/t', usecols=([1,2,3,4,5,6,7]), dtype={'names': ('feature1', 'feature2', 'feature3', 'feature4', 'feature5', 'feature6', 'class'), 'formats': ('f2', 'f2', 'f2', 'f2', 'f2', 'f2', 'i')}))
y = np.loadtxt('test_dataset', dtype={'names': ('key', 'feature1', 'feature2', 'feature3', 'feature4', 'feature5', 'feature6', 'class'), 'formats': ('S30', 'f2', 'f2', 'f2', 'f2', 'f2', 'f2', 'i')})
print y.shape
print y.size
print y

print y[1]
y_len = len(y[1])
print y_len
myrange = range(1,y_len)
print myrange
print myrange[1:3]
mylist = list(y[1])[1:3]
print np.array(mylist)
#print y[1][1:3]

