% mins.sty
% Take minutes of meetings
% 2005-Sept-01 Jim Hefferon jhefferon (at) smcvt.edu
% --- Class structure: identification part
% ---
\ProvidesClass{test_latex_class}[2005/09/01 version 1.00 Minutes of meetings]
\NeedsTeXFormat{LaTeX2e}

% --- Class structure: declaration of options part
% ---
% This class extends the article class
% Read all the documentclass options; pass them to article,
% unless the file "<currentoption>.min" exists, then it is loaded
\DeclareOption*{\InputIfFileExists{\CurrentOption.min}{}{%
\PassOptionsToClass{\CurrentOption}{article}}}
% --- Class structure: execution of options part
% ---
\ProcessOptions \relax
% --- Class structure: declaration of options part
% ---
\LoadClass{article}


\RequirePackage{etoolbox}
\RequirePackage{ifthen}
\RequirePackage{xcolor}
\RequirePackage{xargs}
\RequirePackage{suffix}
\RequirePackage{hyperref}
%\RequirePackage{etoolbox}



\RequirePackage[left=1in,right=1in,top=1in,bottom=1in]{geometry}

\RequirePackage{fancyhdr}
\fancypagestyle{firstpage}{%
    \fancyhf{} % clear all six fields
    \renewcommand{\headrulewidth}{0pt}
    \renewcommand{\footrulewidth}{0pt}
}
\fancypagestyle{followingpage}{%
    \fancyhf{} % clear all six fields
    \fancyhead[RE,LO]{\show@committee, \show@date}
%    \fancyhead[RE,LO]{\show@date}
    \fancyhead[LE,RO]{page \thepage}
    \renewcommand{\headrulewidth}{0.7pt}
    \renewcommand{\footrulewidth}{0pt}
}
\pagestyle{followingpage}
\AtBeginDocument{\thispagestyle{firstpage}}

% who is meeting?
\def\@members{None}
\newcommand{\setmembers}[1]{\def\@members{#1}}
\newcommand{\show@members}{\@members}

% committee?
\global\let\@committee\@empty
\newcommand{\setcommittee}[1]{\def\@committee{#1}}
\let\committee\setcommittee %
\newcommand{\show@committee}{\@committee}

% who is absent?
\global\let\@absent\@empty
\newcommand{\setabsent}[1]{\def\@absent{#1}}
\let\absent\setabsent %
\newcommand{\show@absent}{\@absent}

% who is also present?
\global\let\@alsopresent\@empty
\newcommand{\setalsopresent}[1]{\def\@alsopresent{#1}}
\let\alsopresent\setalsopresent %
\newcommand{\show@alsopresent}{\@alsopresent}

% what day is it?
\def\@date{\today}
\newcommand{\setdate}[1]{\def\@date{#1}}
\newcommand{\show@date}{\@date}

% what role do they have (e.g., chair)
\newcommand{\role}[2]{#1~(#2)}
\newcommand{\chair}[1]{\role{#1}{Chair}}
\newcommand{\secretary}[1]{\role{#1}{Secretary}}

% material heading the minutes; first try
\newcommand{\opening@list}{
    \begin{description}
	\item[Members:] \show@members
	\item[Absent:] \show@absent
	\item[Also present:] \show@alsopresent
    \end{description}
}

% environments inside the minutes
\newenvironment{businesslist}[1]{%
    %\renewcommand\theenumi{\alph{\enumi}}
    \vspace{2ex}\par\noindent\textbf{#1}\par
    \begin{enumerate}
	}{%
    \end{enumerate}
}
\newenvironment{business}{%
    \begin{businesslist}{Business}
    }{%
    \end{businesslist}
}


\newenvironment{minutes}{%
    \begin{center}
	{\large\textbf{Minutes, \show@committee}} \\[1ex]
	\show@date
    \end{center}
    \vspace{1.5ex}
    \opening@list
    \vspace{1ex}
}{%
}

\setlength{\parindent}{0\p@}
% colors
\definecolor{color0}{rgb}{0,0,0}% main default color, normally left to black
\definecolor{color1}{rgb}{0.22,0.45,0.70}% primary theme color
\definecolor{color2}{rgb}{0,0,0}% secondary theme color
\definecolor{color3}{rgb}{0,0,0}% tertiary theme color

\newlength{\maketitlewidth}%

\newcommand*{\sectionfont}{}
\newcommand*{\subsectionfont}{}

\newcommand*{\sectionstyle}[1]{{\sectionfont#1}}
\newcommand*{\subsectionstyle}[1]{{\subsectionfont#1}}

\renewcommand*{\sectionfont}{\Large\bfseries\upshape}
\renewcommand*{\subsectionfont}{\large\upshape\fontseries{sb}\selectfont}

\renewcommand*{\sectionstyle}[1]{{\sectionfont\textcolor{color1}{#1}}}
\renewcommand*{\subsectionstyle}[1]{{\subsectionfont\textcolor{color1}{#1}}}
\newcommand{\subsectionfill}{\xleaders\hbox to 0.35em{\scriptsize.}\hfill}% different subsectionfills will not be perfectly aligned, but remaining space at the end of the fill will be distributed evenly between leaders, so it will be barely visible

\renewcommand{\section}[1]{%
  \par\addvspace{2.5ex}%
  \phantomsection{}% reset the anchor for hyperrefs
  \addcontentsline{toc}{section}{#1}%
  \strut\sectionstyle{#1}%
  {\color{color1}\hrule}%
  \par\nobreak\addvspace{1ex}\@afterheading
}

\newcommand*{\flushmaketitle}{%
  \strut\usebox{\maketitlebox}%
  \savebox{\maketitlebox}{}%
  \savebox{\maketitletempbox}{}%
}

\renewcommand*{\maketitle}{%
  \setlength{\maketitlewidth}{0.8\textwidth}%
  \hfil%
  }

