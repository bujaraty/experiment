#!/bin/bash -l

pdflatex test_get_coordinate.tex
if [ -e test_get_coordinate.pdf ]
then
    evince test_get_coordinate.pdf &
fi


