#!/usr/bin/env perl
use strict;


my $srce = "/home/jessada/development/experiment/perl/test_grep/input1";
my $string1 = "INFO";

print "purpose : simply to see how can I use grep in perl\n";
print "result of grep !/^#/ input1 :\n";
open my $fh, "<", $srce or die "Could  not open $srce: $!";
#open my $fh, "<" , $srce or die "Could not open $scre: $!";

my @lines =  grep !/^#/, <$fh>;
print @lines;

