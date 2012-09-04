#!/bin/bash -l

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "purpose : To see if it can find substition process"
echo "script  : $script_dir/test_args.sh -i 3 -b 2 <( cat input1 )"
echo

$script_dir/test_args.sh -i 3 -b 2 <( cat input1 )




