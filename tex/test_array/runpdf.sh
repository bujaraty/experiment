#!/bin/bash -l

#figure_file_name="figures_hbvdb_elsarticle-manuscript"
#latex -shell-escape $figure_file_name
#
#if [ -e "$figure_file_name"-figure0.eps ]
#then
#
#    mv "$figure_file_name"-figure0.eps fig_hbvdb_architecture.eps
#    mv "$figure_file_name"-figure1.eps fig_filtering_evaluation_data_flow.eps
#    mv "$figure_file_name"-figure2.eps fig_database_architecture.eps
latex test_array
if [ -e test_array.dvi ]
then
    bibtex test_array
    latex test_array
    latex test_array
    dvipdfm test_array
    if [ -e test_array.pdf ]
    then
	rm *.aux
	rm *.bbl
	rm *.blg
	rm *.dvi
	rm *.log
	rm *.out


	evince test_array.pdf &
    fi
fi



