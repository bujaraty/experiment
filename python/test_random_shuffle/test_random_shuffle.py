#!/usr/bin/python

import random;

print 'before shuffle'
my_list = []
my_list.append({'a': 11, 'b': 12, 'c': 13})
my_list.append({'a': 21, 'c': 23})
my_list.append({'a': 32, 'c': 33})
my_list.append({'a': 41, 'b': 42, 'c': 43, 'd': 44})
my_list.append({'a': 51, 'c': 53, 'd': 54})
my_list.append({'a': 61, 'c': 63})
my_list.append({'a': 71, 'c': 73})
my_list.append({'a': 81, 'c': 83})
my_list.append({'a': 91, 'c': 93})



for i in xrange(len(my_list)):
    print i, my_list[i]

my_list = [x for x in my_list if 'd' not in x]

print
print 'after shuffle'
random.seed(4)
random.shuffle(my_list)

for i in xrange(len(my_list)):
    print i, my_list[i]



