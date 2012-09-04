#!/bin/bash -l

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "purpose : To see how to catch parsing error'"
echo "script  : cat input1 | $script_dir/test_args.pl -bi2 -a 3 -def -j" 
echo

cat input1 | $script_dir/test_args.pl -bi2 -a 3 -def -j

