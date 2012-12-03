#!/usr/bin/python

import numpy as np
x1 = np.arange(20).reshape((4,5))
x2 = np.arange(12).reshape((3,4))
np.savez('mysave.npz', x1=x1, y=x2)

