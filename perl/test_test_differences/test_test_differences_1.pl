#!/usr/bin/env perl
use strict;
use Test::More tests => 4;
use Test::Differences;

print "purpose : to see how different diff style in Test::Differences produce the comparison with bad result\n";

my $my_result = "/home/jessada/development/experiment/perl/test_test_differences/bad_result";
my $expected_result = "/home/jessada/development/experiment/perl/test_test_differences/expected";

open my $fh_my_result, "<", $my_result or die "Could  not open $my_result: $!";
open my $fh_expected_result, "<", $expected_result or die "Could  not open $expected_result: $!";

my @lines_my_result =  grep !/^#/, <$fh_my_result>;
my @lines_expected_result =  grep !/^#/, <$fh_expected_result>;

#chomp @lines_my_result;
print "my result : \n";
print @lines_my_result;


#chomp @lines_expected_result;
print "expected result : \n";
print @lines_expected_result;


print "result of the comparison with bad result :\n";
table_diff;
eq_or_diff_text \@lines_my_result, \@lines_expected_result, 'table diff';
unified_diff;
eq_or_diff_data \@lines_my_result, \@lines_expected_result, 'unified diff';
context_diff;
eq_or_diff \@lines_my_result, \@lines_expected_result, 'context diff';
oldstyle_diff;
eq_or_diff \@lines_my_result, \@lines_expected_result, 'oldstyle diff';



