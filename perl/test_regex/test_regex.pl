#!/usr/bin/env perl

use strict;


my $my_dir = "/home/jessada/development/experiment/perl/test_regex";
my ($result_dir) = $my_dir =~ /^(\/\w*\/\w*)/;
print "$result_dir\n";

