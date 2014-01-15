#!/usr/bin/python

import numpy as np
import matplotlib
#matplotlib.use('Agg')
import matplotlib.pyplot as plt
#plt.plot([1,2,3,4])
#plt.ylabel('some numbers')
#plt.show()

x = np.arange(0, 10, 0.005)
y = np.exp(-x/2.) * np.sin(2*np.pi*x)
#
#print x
#
#fig = plt.figure()
#ax = fig.add_subplot(111)
#ax.plot(x,y)
#ax.set_ylabel('some numbers')
#fig.savefig('test.eps')

x = []
y = []
for i in xrange(1, 8):
    for j in xrange(1, 8):
        x.append(i)
        y.append(j)
x = np.array(x)
y = np.array(y)

fig = plt.figure()
ax = fig.add_subplot(1, 1, 1)
circ = plt.Circle((5, 2), radius=3.9, color='g')
ax.plot(x,y, 'r*')
ax.set_ylim([0, 8])
ax.set_xlim([0, 8])
ax.set_ylabel('some numbers')
ax.add_patch(circ)
plt.show()
