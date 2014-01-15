import animals as a
import numpy as np

map_rows      = 100
features_size = len(a.properties)
weight        = np.random.rand(map_rows, features_size)
neighbors     = 50
epoch         = 100
for j in xrange(epoch):
    update_size = np.ceil(neighbors*(epoch-j-1) / (epoch-1))
    for animal in a.animals:
        diff = a.props[animal] - weight
        dist = np.sum(diff*diff, axis=1)
        winner = np.argmin(dist)

        min_neighbor = int(winner - update_size)
        if min_neighbor < 0:
            min_neighbor = 0
        max_neighbor = int(winner + update_size)
        if max_neighbor > map_rows:
            max_neighbor = map_rows
        for i in xrange(min_neighbor, max_neighbor):
            weight[i] += diff[i] * 0.2

order = {}
for animal in a.animals:
    diff = a.props[animal] - weight
    dist = np.sum(diff*diff, axis=1)
    winner = np.argmin(dist)

    order[animal] = winner

def compare(x, y):
    if order[x] < order[y]:
        return -1
    if order[x] > order[y]:
        return 1
    return 0


print sorted(a.animals, cmp=compare)
