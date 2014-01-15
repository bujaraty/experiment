import numpy as np
import matplotlib
import matplotlib.pyplot as plt

a = [1, 2, 2, 4, 4]
b = [2, 1, 3, 3, 5]
#a = [1, 2, 3, 4, 5]
#b = [7, 9, 11, 13, 15]
plt.plot(a, b, 'ro')
plt.axis([0,6,0,16])
plt.show()

print np.cov(a,b)
print np.corrcoef(a,b)

#x = np.arange(0, 10, 0.005)
#y = np.exp(-x/2.) * np.sin(2*np.pi*x)
#
#print x
#
#fig = plt.figure()
#ax = fig.add_subplot(111)
#ax.plot(x,y)
#ax.set_ylabel('some numbers')
#fig.savefig('test.eps')
#
#plt.show()
