% mins.sty
% Take minutes of meetings
% 2005-Sept-01 Jim Hefferon jhefferon (at) smcvt.edu
% --- Class structure: identification part
% ---
\ProvidesClass{application}[2005/09/01 version 1.00 Minutes of meetings]
\NeedsTeXFormat{LaTeX2e}

% --- Class structure: declaration of options part
% ---
% This class extends the article class
% Read all the documentclass options; pass them to article,
% unless the file "<currentoption>.min" exists, then it is loaded
\DeclareOption*{\InputIfFileExists{\CurrentOption}{}{%
\PassOptionsToClass{\CurrentOption}{article}}}
% --- Class structure: execution of options part
% ---
\ProcessOptions \relax
% --- Class structure: declaration of options part
% ---
\LoadClass[11pt]{article}

\RequirePackage[left=2cm,right=2cm,top=2cm,bottom=2cm]{geometry}
\RequirePackage{ifthen}
\RequirePackage{xcolor}
\RequirePackage{hyperref}
\RequirePackage{calc}
\RequirePackage{arrayjobx}
\RequirePackage{multido}
\RequirePackage{enumitem}
    %\RequirePackage{etoolbox}
    %    \RequirePackage{xargs}
%    \RequirePackage{suffix}

%\let\TAB\tabular
%\renewcommand\tabular{\noindent\TAB} 
%-------------------------------------------------------------------------------
%                overall design commands definitions
%-------------------------------------------------------------------------------
% colors
\definecolor{color0}{rgb}{0,0,0}% main default color, normally left to black
\definecolor{color1}{rgb}{0,0,0}% primary theme color
\definecolor{color2}{rgb}{0,0,0}% secondary theme color
\definecolor{color3}{rgb}{0,0,0}% tertiary theme color

% MarVoSym font for symbols
\newcommand*{\marvosymbol}[1]{}
\renewcommand*{\marvosymbol}[1]{{\fontfamily{mvs}\fontencoding{U}\fontseries{m}\fontshape{n}\selectfont\char#1}}

% symbols
%   itemize labels (the struts were added to correct inter-item spacing (works for single line items, until a solution is found for multi-line ones...)
\renewcommand*{\labelitemi}{\strut\textcolor{color1}{\marvosymbol{123}}}% equivalent to \Neutral from marvosym package; alternative: \fontencoding{U}\fontfamily{ding}\selectfont\tiny\symbol{'102}
\renewcommand*{\labelitemii}{\strut\textcolor{color1}{\large\bfseries-}}
\renewcommand*{\labelitemiii}{\strut\textcolor{color1}{\rmfamily\textperiodcentered}}% alternative: \textasteriskcentered; the \rmfamily is required to force Latin Modern fonts when using sans serif, as OMS/lmss/m/n is not defined and gets substituted by OMS/cmsy/m/n
\renewcommand*{\labelitemiv}{\labelitemiii}

% fonts
\AtBeginDocument{\normalfont\color{color0}}

% loads a style scheme
\newcommand*{\ApplicationStyle}[1]{
  \RequirePackage{ApplicationStyle#1}}

% loads a color scheme
\newcommand*{\ApplicationColor}[1]{
  \RequirePackage{ApplicationColor#1}}

% loads a content
\newcommand*{\ApplicationContent}[1]{
  \RequirePackage{#1}}

% recomputes all automatic lengths
\AtBeginDocument{\recomputecvlengths{}}

%-------------------------------------------------------------------------------
%                resume style definition
%-------------------------------------------------------------------------------
\newcommand*{\listitemsymbol}{\labelitemi~}

\newsavebox{\maketitlebox}%
\newsavebox{\maketitletempbox}%
\newlength{\maketitlewidth}%
\newlength{\maketitleboxwidth}%

% minimal base settings
\setlength\lineskip{1\p@}
\setlength\normallineskip{1\p@}
\renewcommand\baselinestretch{}
\setlength{\parindent}{0\p@}
\setlength{\parskip}{0\p@}
\setlength\columnsep{10\p@}
\setlength\columnseprule{0\p@}
\setlength\fboxsep{3\p@}
\setlength\fboxrule{.4\p@}
\setlength\arrayrulewidth{.4\p@}
\setlength\doublerulesep{2\p@}

\raggedbottom
\onecolumn

% fonts
\newcommand*{\titlefont}{}
\newcommand*{\subtitlefont}{}
\newcommand*{\sectionfont}{}
\newcommand*{\subsectionfont}{}
\newcommand*{\hintfont}{}
\newcommand*{\subcontentfont}{}
\newcommand*{\addressfont}{}

% styles
\newcommand*{\titlestyle}[1]{{\titlefont#1}}
\newcommand*{\subtitlestyle}[1]{{\subtitlefont#1}}
\newcommand*{\sectionstyle}[1]{{\sectionfont#1}}
\newcommand*{\subsectionstyle}[1]{{\subsectionfont#1}}
\newcommand*{\hintstyle}[1]{{\hintfont#1}}
\newcommand*{\subcontentstyle}[1]{{\subcontentfont#1}}

% recompute all resume lengths
\newcommand*{\recomputecvlengths}{}

\newcommand*{\flushmaketitle}{%
  \strut\usebox{\maketitlebox}%
  \savebox{\maketitlebox}{}%
  \savebox{\maketitletempbox}{}%
  \setlength{\maketitleboxwidth}{0pt}}

% makes title in center plain format
% usage: \makecenterplaintitle{title}
\newcommand*{\makeplaintitle}[1]{%
    \renewcommand*{\titlefont}{\Huge\bfseries\upshape}
    \renewcommand*{\titlestyle}[1]{{\titlefont\textcolor{color1}{#1}}}
    \renewcommand*{\subtitlefont}{\Huge\bfseries\upshape}
    \renewcommand*{\subtitlestyle}[1]{{\subtitlefont\textcolor{color1}{#1}}}
    \setlength{\maketitlewidth}{0.8\textwidth}%
    \hfil%
    \parbox{\maketitlewidth}{%
	\centering%
    %title
	\titlestyle{#1}
	\flushmaketitle\\% need to force a \par after this to avoid weird spacing bug at the first section if no blank line is left after \maketitle
    }\\[2.5em]
}% need to force a \par after this to avoid weird spacing bug at the first section if no blank line is left after \maketitle

% makes cv title in center plain format
% usage: \makecenterplaincvtitle{title}
\newcommand*{\makecenterplaincvtitle}[1]{%
    \makeplaintitle{#1}
}% need to force a \par after this to avoid weird spacing bug at the first section if no blank line is left after \maketitle

% makes title in classic plain format
% usage: \makeclassicplaintitle{title}{subtitle}{picture}
\newcommand*{\makecasualplaintitle}[3]{%
    \renewcommand*{\titlefont}{\fontsize{38}{40}\mdseries\upshape}
    \renewcommand*{\subtitlefont}{\fontsize{18}{20}\mdseries\itshape}
  % recompute lengths (in case we are switching from letter to resume, or vice versa)
    \recomputecvlengths%
  % optional picture
    {\hfill\raggedleft\titlefont{\color{color2}#1}}\\[-.35em]% alternate design: \MakeLowercase and no space
  % optional title
    \ifthenelse{\equal{#2}{}}{}
    {
	{\color{color2!50}\rule{\textwidth}{.25ex}}%
	\\[0.75em]\null\hfill\subtitlestyle{#2}
    }
    \\[0.5em]% \null is required as there is no box on the line after \\, so glue (and leaders) disappears; this is in contrast to after \par, where the next line starts with an indent box (even after \noindent).
    \par
}% to avoid weird spacing bug at the first section if no blank line is left after \maketitle


% makes a resume line with a header and a corresponding text
% usage: \cvitem[spacing]{header}{text}
\newcommand*{\cvitem}[3][.25em]{}

% makes a resume line 2 headers and their corresponding text
% usage: \cvdoubleitem[spacing]{header1}{text1}{header2}{text2}
\newcommand*{\cvdoubleitem}[5][.25em]{}

% makes a resume line with a list item
% usage: \cvlistitem[label]{item}
\newcommand*{\cvlistitem}[2][\listitemsymbol]{}

% makes a resume line with 2 list items
% usage: \cvlistdoubleitem[label]{item1}{item2}
\newcommand*{\cvlistdoubleitem}[3][\listitemsymbol]{}

% makes a typical resume job / education entry
% usage: \cventry[spacing]{years}{degree/job title}{institution/employer}{localization}{optionnal: grade/...}{optional: comment/job description}
\newcommand*{\cventry}[7][.25em]{}

%-------------------------------------------------------------------------------
%                letter design commands definitions
%-------------------------------------------------------------------------------
% elements
\newcommand*{\recipient}[2]{\def\@recipientname{#1}\def\@recipientaddress{#2}}
\renewcommand*{\date}[1]{\def\@date{#1}}\date{\today}
\newcommand*{\opening}[1]{\def\@opening{#1}}
\newcommand*{\closing}[1]{\def\@closing{#1}}
\newcommand*{\enclosure}[2][]{%
  % if an optional argument is provided, use it to redefine \enclname
    \ifthenelse{\equal{#1}{}}{}{\renewcommand*{\enclname}{#1}}%
    \def\@enclosure{#2}
}

% recompute all letter lengths
\newcommand*{\recomputeletterlengths}{}

% makes the center plain letter title
% usage: \makecenterplainlettertitle{title}
\newcommand*{\makecenterplainlettletitle}[1]{%
    \makeplaintitle{#1}
    \par%
   % recipient block
%    \begin{tabular*}{\textwidth}{@{}l@{\extracolsep{\fill}}r@{}}%
%	{\bfseries\upshape\@recipientname} & {\@date} \\%
%    \end{tabular*}%

    \begin{minipage}[t]{.7\textwidth}
	\raggedright%
	\addressfont%
	{\bfseries\upshape\@recipientname}\\%
	\@recipientaddress%
    \end{minipage}
  % date
    \hfill % US style
    \@date\\[2em]% US informal style: "April 6, 2006"; UK formal style: "05/04/2006"
  % opening
    \raggedright%
    \@opening\\[1.5em]%
  % ensure no extra spacing after \makelettertitle due to a possible blank line
    \hspace{0pt}\par\vspace{-\baselineskip}\vspace{-\parskip}
}% need to force a \par after this to avoid weird spacing bug at the first section if no blank line is left after \maketitle

% makes the letter footer
% usage: \makeletterfooter
\newcommand*{\makeletterfooter}{\makefooter}

% makes the letter closing
% usage: \makeletterclosing
\newcommand*{\makeletterclosing}{}

\renewcommand*{\makeletterclosing}[1]{
  \addvspace{4ex}
  \@closing\\[3em]%
  {\bfseries #1}%
  \ifthenelse{\isundefined{\@enclosure}}{}{%
    \\%
    \vfill%
    {\color{color2}\itshape\enclname: \@enclosure}}}

%-------------------------------------------------------------------------------
%                resume content definition
%-------------------------------------------------------------------------------

\newcommand*{\SectionPersonalInfo}{%
    \section{Personal Information}
    \cvdoubleitem{First name}{\firstname}{Phone number}{\phoneno}
    \cvdoubleitem{Last name}{\lastname}{Nationality}{\nationality}
    \cvdoubleitem{Email}{\email}{Date of birth}{\birthdate}
}

\newcommand*{\SectionProfessionalExperience}{%
    \section{Professional Experience}
    \multido{\iData=1+1}{10}{%
	\checkJobPeriods(\iData)
	\ifthenelse{\equal{\cachedata}{}}{}{%
	    \cventry{\JobPositions(\iData)}{\JobCities(\iData)}{\JobLocations(\iData)}{\JobPeriods(\iData)}{\cvlistitem{\JobDescriptions(\iData)}}
	}
    }
}

\newcommand*{\SectionEducation}{%
    \section{Education}
    \multido{\iData=1+1}{10}{%
	\checkEducationInstitutes(\iData)
	\ifthenelse{\equal{\cachedata}{}}{}{%
	    \cventry{\EducationInstitutes(\iData)}{\EducationCities(\iData)}{\EducationDegrees(\iData)}{\EducationPeriods(\iData)}{}
	}
    }
}

\newcommand*{\SectionMasterThesis}{%
    \section{Master Thesis}
    \cvitem{Title}{\MasterThesisTitle}
    \cvitem{Supervisor}{\MasterThesisSupervisor}
    \cvitem{Description}{\MasterThesisDescription}
}

\newcommand*{\SectionReferees}{%
    \section{Referees}
    \multido{\iData=1+1}{10}{%
	\checkRefereeNames(\iData)
	\ifthenelse{\equal{\cachedata}{}}{}{%
	    \cventry{\RefereeNames(\iData)}{}{\RefereeAffiliations(\iData)}{}{email : \RefereeEmails(\iData)}
	}
    }
}

\newcommand*{\SectionPublication}{%
    \section{Publication}
    I am in a process of writing two manuscripts to publish the results from my master thesis. The manuscripts are expected to be done within this year(2012).
}

\newcommand*{\MakeLetterClosing}{%
    \makeletterclosing{\firstname ~ \lastname}
}


\endinput


%% end of file `application.cls'.


