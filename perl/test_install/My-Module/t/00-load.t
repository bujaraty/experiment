#!perl -T

use Test::More tests => 1;

BEGIN {
    use_ok( 'My::Module' ) || print "Bail out!\n";
}

diag( "Testing My::Module $My::Module::VERSION, Perl $], $^X" );
