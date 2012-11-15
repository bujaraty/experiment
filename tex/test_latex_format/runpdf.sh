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

    latex test_latex_format
    bibtex test_latex_format
    latex test_latex_format
    latex test_latex_format
    dvipdfm test_latex_format
    if [ -e test_latex_format.pdf ]
    then
	rm *.aux
	rm *.auxlock
	rm *.bbl
	rm *.blg
	rm *.dpth
	rm *.dvi
	rm *.glo
	rm *.idx
	rm *.ist
	rm *.log
	rm *.out
	rm *.spl


	evince test_latex_format.pdf &
    fi
#fi



