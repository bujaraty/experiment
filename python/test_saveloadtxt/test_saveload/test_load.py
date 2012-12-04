#!/usr/bin/python

import numpy as np

npzfiles = np.load('mysave.npz')
print npzfiles['x1']
print npzfiles['y']

