import datetime, time;

class A(object):
    def whoami(self):
        print self.__class__.__name__

class B(A):
    pass

o = B()
o.whoami()
