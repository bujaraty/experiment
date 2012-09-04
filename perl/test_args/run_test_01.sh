#!/bin/bash -l

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "purpose : To see the effect of '--'"
echo "script  : $script_dir/test_args.pl -bi2 input1 -a 3 --def" 
echo

$script_dir/test_args.pl -bi2 input1 -a 3 --def
