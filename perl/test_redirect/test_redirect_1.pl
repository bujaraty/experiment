#!/usr/bin/env perl
use strict;

use Bvdb_test qw(clear_db get_absolute_db_dir);

open(STDERR, ">logfile");
system("$^X", "/home/jessada/development/scilifelab/projects/hbvdb/bin/bvd-add.pl", "/home/jessada/development/scilifelab/projects/hbvdb/testcase/bvd_add/case_bvd_add_18/case_bvd_add_18_1.vcf");
