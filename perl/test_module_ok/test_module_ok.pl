#!/usr/bin/env perl
use strict;
use Test::More tests => 4;

print "purpose : to see the effect of 'use_ok' and 'require_ok' (It's a bit obsolete since every module here are installed)\n";
print "result :\n";

use_ok('Log::Log4perl');
require_ok('Log::Log4perl');
use_ok('Test::Differences');
require_ok('Test::Differences');



