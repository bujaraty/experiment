#!/bin/bash -l

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

$script_dir/test_args.sh -i 3 -b 2 <( cat input1 )




