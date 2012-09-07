use strict;

use Cwd 'abs_path';
use File::Basename;


print "before pwd : ", dirname(abs_path($0)), "\n";

my $relative_dir = "../../../experiment";
my $result_dir = `cd $relative_dir; pwd`;
print "result dir : $result_dir\n";

print "after pwd : ", dirname(abs_path($0)), "\n";


