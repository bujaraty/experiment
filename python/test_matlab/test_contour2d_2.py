#!/usr/bin/python

import matplotlib.pyplot as plt
from matplotlib.colors import BoundaryNorm
from matplotlib.ticker import MaxNLocator
import numpy as np
from pylab import arange
from pylab import meshgrid
from matplotlib import cm
from pylab import contourf


# make these smaller to increase the resolution
x = arange(1.0, 4.001, 1)
y = arange(1.0, 4.001, 1)
X, Y = meshgrid(x, y)
Z = np.array([[0, 0, 423, 0], [0, 680, 595, 0], [0, 523, 0, 0], [503, 0, 0, 648]])

# x and y are bounds, so z should be the value *inside* those bounds.
# Therefore, remove the last value from the z array.
#z = z[:-1, :-1]
#my_levels = MaxNLocator(nbins=15)
#levels = my_levels.tick_values(z.min(), z.max())


# pick the desired colormap, sensible levels, and define a normalization
# instance which takes data values and translates those into levels.

plt.subplot(1, 1, 1)
#levels = arange(-1, 700, 0.5) # Boost the upper limit to avoid truncation
levels = np.array([0, 400, 420, 440, 460, 480, 500, 520, 540, 560, 580, 600, 620, 640, 660, 680, 700])  # Boost the upper limit to avoid truncation
                                  # errors.

#norm = cm.colors.Normalize(vmax=690, vmin=400)
norm = cm.colors.Normalize(vmax=abs(Z).max(), vmin=abs(Z).min())
cmap = cm.PRGn


print "X", X
print "Y", Y
print "Z", Z
print "levels shape arange(-2.0, 1.601, 0.05)", levels.shape


cset1 = contourf(X, Y, Z, levels,
                        cmap=cm.get_cmap(cmap, len(levels)-1),
                        norm=norm,
                        )
# set the limits of the plot to the limits of the data
plt.axis([x.min(), x.max(), y.min(), y.max()])



#plt.subplot(2, 1, 2)
## contours are *point* based plots, so convert our bound into point
## centers
#plt.contourf(x[:-1, :-1] + dx / 2.,
#             y[:-1, :-1] + dy / 2., z, levels=levels,
#             cmap=cmap)
plt.colorbar()
plt.title('contourf with levels')


plt.show()
