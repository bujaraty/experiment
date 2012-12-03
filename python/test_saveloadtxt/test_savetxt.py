#!/usr/bin/python

import numpy as np
x = np.arange(20).reshape((4,5))
np.savetxt('mysave.txt', x)

