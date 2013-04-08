use strict;
use Getopt::Long;

my $fh;

open($fh,"< test_fh.vcf") or error("test_fh.vcf: $!");


unlink('tmp');
open(my $sort_fh,"| sort -t'\t' -k1,1V -k2,2n -k4,4n >> tmp");
open(my $header_fh," >> tmp");

my $unflushed = select(STDOUT); 
$| = 1; 

while (my $line=<$fh>)
{
    if ( $line=~/^#/ ) { print $header_fh $line; next; }
    print $sort_fh $line;
    last;
}
select($unflushed);
while (my $line=<$fh>)
{
    print $sort_fh $line;
}

