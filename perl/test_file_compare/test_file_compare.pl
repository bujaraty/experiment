#!/usr/bin/env perl
use strict;
use File::Compare;

print "purpose : to test file compare\n";
print "result of the good comparison :\n";

my $my_result = "/home/jessada/development/experiment/perl/test_file_compare/good_result";
my $expected_result = "/home/jessada/development/experiment/perl/test_file_compare/expected";

if (compare($my_result,$expected_result) == 0) {
    print "They're equal\n";
}
