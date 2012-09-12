#!/usr/bin/env perl
use strict;

my @my_args;

push @my_args, "-bi2";
push @my_args, "-a";
push @my_args, "3";
push @my_args, "--def";

#print "@my_args\n";

system($^X, "/home/jessada/development/experiment/perl/test_args/test_args.pl", @my_args);

my @output = system($^X, "/home/jessada/development/scilifelab/projects/hbvdb/bin/bvd-get.pl");

foreach my $line (@output) {
    print $line;
}

