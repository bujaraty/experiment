#!/bin/bash -l
script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

$script_dir/test_save.py
#cat $script_dir/mysave.txt
echo
$script_dir/test_load.py


