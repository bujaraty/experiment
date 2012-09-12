#!/usr/bin/env perl
use strict;

my @my_args;

push @my_args, 'input1';
push @my_args, '"^##"';

my $cmd = 'grep "^##" input1';
my @lines = `$cmd`;
#my @lines = system("/bin/bash", "grep", @my_args);


foreach my $line (@lines) {
    print $line;
}
