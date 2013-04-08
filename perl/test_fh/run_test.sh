#!/bin/bash -l

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
perl $script_dir/test_fh.pl
