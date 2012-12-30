#!/usr/bin/python

import datetime, time;


class MyList(list):
    def __init__(self, *args):
        list.__init__(self, *args)

    def my_print(self):
#        print list.__getitem__(self, 0)
        print self[0]

    def print_all(self):
        for item in self:
            print item

my_list = MyList()
my_list.append('ab')
my_list.append('cd')
my_list.append('ef')

del my_list[1]

my_list.print_all()
#for item in my_list:
#    print item

my_list.my_print()

other_list = []
other_list.append('AAA')
other_list.append('BB')

my_list[:] = other_list
my_list.print_all()

#other_list.print_all()


