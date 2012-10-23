#!/bin/bash -l


file_name="figures_hbvdb_elsarticle"
rm *.eps
latex -shell-escape $file_name.tex

if [ -e "$file_name"-figure0.eps ]
then
    rm *.aux
    rm *.dvi
    rm *.log
    rm *.dpth
    rm *.auxlock

    evince "$file_name"-figure0.eps &
fi




