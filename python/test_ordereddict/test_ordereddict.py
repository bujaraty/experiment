#!/usr/bin/python

from collections import OrderedDict

not_ordered_dict = {}
not_ordered_dict['MrB'] = 100
not_ordered_dict['MrD'] = 200
not_ordered_dict['MrC'] = 300
not_ordered_dict['MrA'] = 400
not_ordered_dict['MrE'] = 500

print 'not ordered'
print
for key in not_ordered_dict:
    print key, not_ordered_dict[key]

ordered_dict = OrderedDict()
ordered_dict['MrB'] = 100
ordered_dict['MrD'] = 200
ordered_dict['MrC'] = 300
ordered_dict['MrA'] = 400
ordered_dict['MrE'] = 500

print
print
print
print 'ordered'
print
for key in ordered_dict:
    print key, ordered_dict[key]

