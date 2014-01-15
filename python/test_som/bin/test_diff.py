import numpy as np

x = np.array([2, 1])
w = np.array([[2, 3],[4, 3],[1, 2], [4, 5]])

diff = x - w
dist = np.sum(diff*diff, axis=1)

print 'x', x
print 'w', w
print 'diff', diff
print 'dist', dist
