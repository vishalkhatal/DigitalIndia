%----------------------------- identification ---------------------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ths}[2011/12/03 v1.0 seminar report]
%----------------------------- initial code -----------------------------------

%--------------------------- declaration of options ---------------------------
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
%--------------------------- execution of options -----------------------------
\ProcessOptions
%--------------------------- package loading ----------------------------------
\LoadClass[12pt,a4paper]{report}%{scrreprt}
%-------------------------------- main code -----------------------------------
\renewcommand{\bibname}{References}
\RequirePackage{amssymb}
%\RequirePackage{graphics}
\RequirePackage{graphicx}
\RequirePackage{fancyhdr}
%\RequirePackage{eucal}
\RequirePackage[USenglish]{babel}
%\RequirePackage[usenames, dvipsnames]{color}
%\RequirePackage[perpage]{footmisc}
%\RequirePackage[square, sort, numbers, authoryear]{natbib}
%\RequirePackage{ifthen}

\long\def\comment#1{}
%\usepackage[dvips]{color}
% We need 1" margins except on the binding edge, where it is 1 1/2"
\usepackage[left=1.40in,right=1.1in,top=0.80in,bottom=0.95in]{geometry}
%\footskip=0cm
%\oddsidemargin .45in
%%\evensidemargin 0.14in
%\marginparwidth 40pt
%\marginparsep 10pt
%\topmargin 0pt
%\headsep 0.2in
%%\textheight 8.1in
%\textwidth 5.59in

%%\textwidth 5.75in
%\textheight 9.5in
%%\footheight 0in
%%\headheight 0.2in
%%\topmargin 0cm
%\topskip 0.0cm




% \author, \title are defined in report; here are the rest of the
% front matter defining macros
\def\dept#1{\gdef\@dept{#1}}
\def\college#1{\gdef\@college{#1}}
\def\supervisor#1{\gdef\@supervisor{#1}}
\def\degree#1{\mbox{\gdef\@degree{#1}}}
\def\submitdate#1{\gdef\@submitdate{#1}}
\def\copyrightyear#1{\gdef\@copyrightyear{#1}} % \author, \title in report
\def\specialization#1{\mbox{\gdef\@specialization{#1}}}
\def\type#1{\gdef\@type{#1}}
\def\@title{}
%\def\@author{}
\def\@dept{Computer Science and Engineering}
\def\@supervisor{}
\def\@degree{Doctor of Philosophy}
\def\@specialization{Computer Science}
\def\@college{SSVPS'\lowercase{s} B. S. Deore College of Engineering, Dhule}
\def\@submitdate{\ifcase\the\month\or
  January\or February\or March\or April\or May\or June\or
  July\or August\or September\or October\or November\or December\fi,
  \space \number\the\year}

\def\hod#1{\gdef\@hod{#1}}
\def\@hod{}
\def\principal#1{\gdef\@principal{#1}}
\def\@principal{Dr. Hitendra D. Patil}



%\ifnum\month=12
%    \@tempcnta=\year \advance\@tempcnta by 1
%    \edef\@copyrightyear{\number\the\@tempcnta}
%\else
    \def\@copyrightyear{\number\the\year}
%\fi
%
\newif\ifcopyright \newif\iffigurespage \newif\iftablespage
\copyrightfalse

\def\prefacesection#1{%
    \chapter*{#1}
    \addcontentsline{toc}{chapter}{#1}}

\def\afterpreface{
    \newpage
    \iftablespage
        {\addvspace{8pt}
        \let\saveaddvspace=\addvspace
        \def\addvspace##1{}
        \listoftables
        \addcontentsline{toc}{listoftables}

        \let\addvspace=\saveaddvspace}


        \newpage
    \fi
    \iffigurespage
        {\addvspace{8pt}
        \let\saveaddvspace=\addvspace
        \def\addvspace##1{}
        \listoffigures
        \let\addvspace=\saveaddvspace}
        \addcontentsline{toc}{chapter}{Figures}%\bf

        \newpage
    \fi
\numberwithin{figure}{chapter}%for figures
\numberwithin{table}{chapter}%for tables
\numberwithin{equation}{chapter}%for equations

\pagestyle{fancy}
\fancyhf{}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
%\fancyhead[R]{\slshape \leftmark}
%\fancyfoot[C]{\thepage}

}


\def\acknowledgeauthor{
\begin{flushright}
\@author
\end{flushright}
}

\setcounter{secnumdepth}{3}

\def\subsubsection{\@startsection{subsubsection}{3}{\z@}{-3.25ex plus  -1ex minus -.2ex}{1.5ex plus .2ex}{\large\sl}}
\def\thesubsubsection{\hbox{\vrule height 1ex width .75ex depth .3ex}}


\newtheorem{condition}{Condition}
\newtheorem{proposition}{Proposition}[chapter]
\newtheorem{theorem}{Theorem}[chapter]
\newtheorem{defn}{Definition}[chapter]
\newtheorem{conjecture}{Conjecture}[chapter]
\newtheorem{lemma}[theorem]{Lemma}
\newtheorem{corollary}[theorem]{Corollary}
\newtheorem{problem}{Problem}[chapter]
\newtheorem{subproblem}{Subproblem}[chapter]


\newenvironment{definition}{\begin{defn}\em}{\end{defn}}
\newenvironment{proof}{\noindent{\bf Proof:}\hspace  {5mm}}{
\nopagebreak\nobreak\quad\nopagebreak\nobreak\proofbox\medskip}
\newenvironment{example}{\noindent{\bf Example}\quad}{
\nopagebreak\nobreak\quad\nobreak\nopagebreak\proofbox\smallskip}

\newcounter{case}
\newenvironment{case}{\begin{list}{\bf Case \arabic{case}:}%
{\usecounter{case}%
\labelwidth 2em
\leftmargin 2em
\setlength\listparindent{\parindent}
\makelabel}
\def\case{\item }}{\end{list}\nobreak\nopagebreak\quad\nopagebreak\nobreak\proofbox\bigskip}
\def\proofbox{\hbox{\vrule height1.2ex depth.3ex width0.8ex}}


\def\thebibliography#1{\chapter*{References\@mkboth
 {References}{References}}
 % {BIBLIOGRAPHY}{BIBLIOGRAPHY}}
% \addcontentsline{toc}{\listoffigures}{References}%\bf

% \addcontentsline{toc}{chapter}{Bibliography}%\bf
 \addcontentsline{toc}{chapter}{References}%\bf
 \list
 {[\arabic{enumi}]}{\settowidth\labelwidth{[#1]}\leftmargin\labelwidth
 \advance\leftmargin\labelsep
 \usecounter{enumi}}
 \def\newblock{\hskip .11em plus .33em minus .07em}
 \sloppy\clubpenalty4000\widowpenalty4000
 \sfcode`\.=1000\relax}
\let\endthebibliography=\endlist
