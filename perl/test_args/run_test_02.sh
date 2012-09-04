#!/bin/bash -l

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "purpose : To see how the parser interpret '-def'"
echo "script  : $script_dir/test_args.pl -bi2 -a 3 -def <( cat input1 )" 
echo

$script_dir/test_args.pl -bi2 -a 3 -def <( cat input1 )

