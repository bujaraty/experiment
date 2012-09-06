#!/usr/bin/env perl
use strict;

eval {print 1/0, "\n";};
 

if ($@) {
    print "exception really happens\n";
}





