\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{notex}[2023/07/02 NoTeX]

\DeclareOption{12pt}{\PassOptionsToClass{12pt}{amsart}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{amsart}}
\ProcessOptions\relax

\LoadClass{amsart}

\RequirePackage{amsmath}
\RequirePackage{amsthm}
\RequirePackage{amssymb}
\RequirePackage{graphicx}
\RequirePackage[margin=0.6in]{geometry}
\RequirePackage{setspace}
\RequirePackage{graphicx}
\RequirePackage{tikz}
\RequirePackage{mathtools}
\RequirePackage[framemethod=tikz]{mdframed}
\RequirePackage{titlesec}
\RequirePackage{fancyhdr}
\RequirePackage{pdfpages}
\RequirePackage{xcolor}
\RequirePackage{thmtools}
\RequirePackage[most]{tcolorbox}
\RequirePackage{hyperref}

\hypersetup{
    colorlinks=true,
    linkcolor=black,
    urlcolor=black,
    citecolor=black,
    linktoc=all
}

\definecolor{pgreen}{HTML}{047101}
\definecolor{pred}{HTML}{FF634D}
\definecolor{pblue}{HTML}{0376BB}
\definecolor{plightgreen}{HTML}{D0FFB8}
\definecolor{plightblue}{HTML}{B3E2FF}
\definecolor{plightred}{HTML}{FE968D}
\definecolor{pyellow}{HTML}{F7BA00}
\definecolor{psilver}{HTML}{D5D5D5}
\definecolor{plightgray}{HTML}{929292}
\definecolor{pgray}{HTML}{929292}
\definecolor{pblack}{HTML}{000000}
\definecolor{pwhite}{HTML}{FFFFFF}

\setstretch{1.5}
\setlength\parindent{0pt}

\usetikzlibrary{arrows,scopes,positioning,cd,calc}

\title{\@ifundefined{title}{}{\@title}}

\def\title#1{\gdef\@title{#1}\gdef\thistitle{#1}}

\DeclareMathOperator{\lcm}{lcm}
\DeclareMathOperator{\ord}{ord}
\DeclareMathOperator{\Ker}{ker}
\DeclareMathOperator{\Aut}{Aut}
\DeclareMathOperator{\Hom}{Hom}
\DeclareMathOperator{\Mor}{Mor}
\DeclareMathOperator{\GL}{GL}
\DeclareMathOperator{\SL}{SL}

\newcommand{\C}{\mathbb{C}}
\newcommand{\N}{\mathbb{N}}
\newcommand{\Q}{\mathbb{Q}}
\newcommand{\R}{\mathbb{R}}
\newcommand{\U}{\mathbb{U}}
\newcommand{\Z}{\mathbb{Z}}
\newcommand{\Zplus}{\mathbb{Z}^{+}}

\newcommand{\floor}[1]{\left\lfloor #1 \right\rfloor}
\newcommand{\ceil}[1]{\left\lceil #1 \right\rceil}
\newcommand{\abs}[1]{\left\lvert #1 \right\rvert}
\newcommand{\norm}[1]{\left\lVert #1 \right\rVert}

\newcommand{\lecture}[1]{\gdef\@lecture{#1}}
\newcommand{\notetaker}[1]{\gdef\@notetaker{#1}}
\renewcommand{\author}[1]{\notetaker{#1}}

\renewcommand{\@maketitle}{
  \newpage
  \null
  \vspace{-0.5in}
  \begin{center}
    \let\footnote\@date
    \ifx\@lecture\undefined
      {\normalsize\bfseries\MakeUppercase{\@title} \par}
    \else
      {\normalsize\bfseries\MakeUppercase{Lecture {\#\@lecture}} \par}
    \fi
    \vskip 0.25em
    \ifx\@notetaker\undefined
      {}
    \else
      {\normalsize\MakeUppercase{\@notetaker}}
    \fi
    \vskip 0.25em
    {\let\thefootnote\relax\footnotetext{\textit{Date}: \@date}}
  \end{center}
  \par
  \vspace{0.5in}
}

\fancypagestyle{notexstyle}{
  \fancyhf{}
  \renewcommand{\headrulewidth}{0pt}
  \fancyhead[LE,RO]{\small\thepage}
  \fancyhead[C]{\scshape\small {{\scshape\small\ifodd\value{page} {\ifx\@lecture\undefined
      {\small{\thistitle} \par}
    \else
      {\small{Lecture {\#\@lecture}} \par}
    \fi}\else {\small\@notetaker}\fi}}}

  \setlength{\headheight}{24.5042pt}
}

\pagestyle{notexstyle}

\titleformat{\section}
  {\normalfont}
  {\large\MakeUppercase{\MakeUppercase{Problem }\arabic{section}.}}
  {0.4em}
  {\large}
  [{\titlerule[0.8pt]\smallskip}]

\titleformat{name=\section,numberless}
  {\normalfont}
  {}
  {0em}
  {\large}
  [{\titlerule[0.8pt]\smallskip}]

\titleformat{\subsection}[runin]
  {\normalfont\bfseries}
  {\textbf{(\alph{subsection})}\ }
  {0em}
  {}
  [.]

\titlespacing{\subsection}
  {0pt}
  {0.5ex plus 0.5ex minus 0.2ex}
  {0.5em}

\titleformat{\subsubsection}[runin]
  {\normalfont}
  {{(\textit{\roman{subsection}})}\ }
  {0em}
  {\itshape}
  [.]

\titlespacing{\subsubsection}
  {0pt}
  {0.5ex plus 0.5ex minus 0.2ex}
  {0.5em}

\renewcommand{\appendix}{
\setcounter{section}{0}
\titleformat{\section}
  {\normalfont}
  {\MakeUppercase{Appendix \alph{section}.}}
  {1em}
  {\MakeUppercase}
  [{\titlerule[0.8pt]\smallskip}]
}

\newcounter{thmcounter}[section]
\newcounter{thmcounternosection}

\renewcommand{\thethmcounter}{\thesection.\arabic{thmcounter}}

\newenvironment{theorem}[1][]
{\par\refstepcounter{thmcounter}\begin{tcolorbox}[title={Theorem \thesection.\arabic{thmcounter}\ifx\\#1\\\else: #1\fi}, colback=black!1, colframe=black!15, coltitle=black, fonttitle=\bfseries,boxsep=2.2mm,left=0.2em,right=0.2em,top=0.2em,bottom=0.2em,enhanced,opacityframe=.75,opacityback=1]\itshape}
{\end{tcolorbox}\par}

\newenvironment{lemma}[1][]
{\par\refstepcounter{thmcounter}\begin{tcolorbox}[title={Lemma \thesection.\arabic{thmcounter}\ifx\\#1\\\else: #1\fi}, colback=black!1, colframe=black!15, coltitle=black, fonttitle=\bfseries,boxsep=2.2mm,left=0.2em,right=0.2em,top=0.2em,bottom=0.2em,enhanced,opacityframe=.75,opacityback=1]\itshape}
{\end{tcolorbox}\par}

\newenvironment{corollary}[1][]
{\par\refstepcounter{thmcounter}\begin{tcolorbox}[title={Corollary \thesection.\arabic{thmcounter}\ifx\\#1\\\else: #1\fi}, colback=black!1, colframe=black!15, coltitle=black, fonttitle=\bfseries,boxsep=2.2mm,left=0.2em,right=0.2em,top=0.2em,bottom=0.2em,enhanced,opacityframe=.75,opacityback=1]\itshape}
{\end{tcolorbox}\par}

\newenvironment{proposition}[1][]
{\par\refstepcounter{thmcounter}\begin{tcolorbox}[title={Proposition \thesection.\arabic{thmcounter}\ifx\\#1\\\else: #1\fi}, colback=black!1, colframe=black!15, coltitle=black, fonttitle=\bfseries,boxsep=2.2mm,left=0.2em,right=0.2em,top=0.2em,bottom=0.2em,enhanced,opacityframe=.75,opacityback=1]\itshape}
{\end{tcolorbox}\par}

\newenvironment{statement}[1][]
{\par\refstepcounter{thmcounter}\begin{tcolorbox}[title={Statement \thesection.\arabic{thmcounter}\ifx\\#1\\\else: #1\fi}, colback=black!1, colframe=black!15, coltitle=black, fonttitle=\bfseries,boxsep=2.2mm,left=0.2em,right=0.2em,top=0.2em,bottom=0.2em,enhanced,opacityframe=.75,opacityback=1]\itshape}
{\end{tcolorbox}\par}

\newenvironment{conjecture}[1][]
{\par\refstepcounter{thmcounter}\begin{tcolorbox}[title={Conjecture \thesection.\arabic{thmcounter}\ifx\\#1\\\else: #1\fi}, colback=black!1, colframe=black!15, coltitle=black, fonttitle=\bfseries,boxsep=2.2mm,left=0.2em,right=0.2em,top=0.2em,bottom=0.2em,enhanced,opacityframe=.75,opacityback=1]\itshape}
{\end{tcolorbox}\par}

\newenvironment{definition}[1][]
{\par\refstepcounter{thmcounter}\begin{tcolorbox}[title={Definition \thesection.\arabic{thmcounter}\ifx\\#1\\\else: #1\fi}, colback=black!1, colframe=black!15, coltitle=black, fonttitle=\bfseries,boxsep=2.2mm,left=0.2em,right=0.2em,top=0.2em,bottom=0.2em,enhanced,opacityframe=.75,opacityback=1]\itshape}
{\end{tcolorbox}\par}

\newenvironment{problem}[1][]
{\par\refstepcounter{thmcounter}\begin{tcolorbox}[title={Problem \thesection.\arabic{thmcounter}\ifx\\#1\\\else: #1\fi}, colback=black!1, colframe=black!15, coltitle=black, fonttitle=\bfseries,boxsep=2.2mm,left=0.2em,right=0.2em,top=0.2em,bottom=0.2em,enhanced,opacityframe=.75,opacityback=1]\itshape}
{\end{tcolorbox}\par}



\newenvironment{theorem*}[1][]
{\par\begin{tcolorbox}[title={Theorem\ifx\\#1\\\else: #1\fi}, colback=black!1, colframe=black!15, coltitle=black, fonttitle=\bfseries,boxsep=2.2mm,left=0.2em,right=0.2em,top=0.2em,bottom=0.2em,enhanced,opacityframe=.75,opacityback=1]\itshape}
{\end{tcolorbox}\par}

\newenvironment{lemma*}[1][]
{\par\begin{tcolorbox}[title={Lemma\ifx\\#1\\\else: #1\fi}, colback=black!1, colframe=black!15, coltitle=black, fonttitle=\bfseries,boxsep=2.2mm,left=0.2em,right=0.2em,top=0.2em,bottom=0.2em,enhanced,opacityframe=.75,opacityback=1]\itshape}
{\end{tcolorbox}\par}

\newenvironment{corollary*}[1][]
{\par\begin{tcolorbox}[title={Corollary\ifx\\#1\\\else: #1\fi}, colback=black!1, colframe=black!15, coltitle=black, fonttitle=\bfseries,boxsep=2.2mm,left=0.2em,right=0.2em,top=0.2em,bottom=0.2em,enhanced,opacityframe=.75,opacityback=1]\itshape}
{\end{tcolorbox}\par}

\newenvironment{proposition*}[1][]
{\par\refstepcounter{thmcounter}\begin{tcolorbox}[title={Proposition\ifx\\#1\\\else: #1\fi}, colback=black!1, colframe=black!15, coltitle=black, fonttitle=\bfseries,boxsep=2.2mm,left=0.2em,right=0.2em,top=0.2em,bottom=0.2em,enhanced,opacityframe=.75,opacityback=1]\itshape}
{\end{tcolorbox}\par}

\newenvironment{statement*}[1][]
{\par\refstepcounter{thmcounter}\begin{tcolorbox}[title={Statement\ifx\\#1\\\else: #1\fi}, colback=black!1, colframe=black!15, coltitle=black, fonttitle=\bfseries,boxsep=2.2mm,left=0.2em,right=0.2em,top=0.2em,bottom=0.2em,enhanced,opacityframe=.75,opacityback=1]\itshape}
{\end{tcolorbox}\par}

\newenvironment{conjecture*}[1][]
{\par\refstepcounter{thmcounter}\begin{tcolorbox}[title={Conjecture\ifx\\#1\\\else: #1\fi}, colback=black!1, colframe=black!15, coltitle=black, fonttitle=\bfseries,boxsep=2.2mm,left=0.2em,right=0.2em,top=0.2em,bottom=0.2em,enhanced,opacityframe=.75,opacityback=1]\itshape}
{\end{tcolorbox}\par}

\newenvironment{definition*}[1][]
{\par\refstepcounter{thmcounter}\begin{tcolorbox}[title={Definition\ifx\\#1\\\else: #1\fi}, colback=black!1, colframe=black!15, coltitle=black, fonttitle=\bfseries,boxsep=2.2mm,left=0.2em,right=0.2em,top=0.2em,bottom=0.2em,enhanced,opacityframe=.75,opacityback=1]\itshape}
{\end{tcolorbox}\par}

\newenvironment{problem*}[1][]
{\par\refstepcounter{thmcounter}\begin{tcolorbox}[title={Problem\ifx\\#1\\\else: #1\fi}, colback=black!1, colframe=black!15, coltitle=black, fonttitle=\bfseries,boxsep=2.2mm,left=0.2em,right=0.2em,top=0.2em,bottom=0.2em,enhanced,opacityframe=.75,opacityback=1]\itshape}
{\end{tcolorbox}\par}



\newenvironment{theorem**}[1][]
{\par\refstepcounter{thmcounternosection}\begin{tcolorbox}[title={Theorem \arabic{thmcounternosection}\ifx\\#1\\\else: #1\fi}, colback=black!1, colframe=black!15, coltitle=black, fonttitle=\bfseries,boxsep=2.2mm,left=0.2em,right=0.2em,top=0.2em,bottom=0.2em,enhanced,opacityframe=.75,opacityback=1]\itshape}
{\end{tcolorbox}\par}

\newenvironment{lemma**}[1][]
{\par\refstepcounter{thmcounternosection}\begin{tcolorbox}[title={Lemma \arabic{thmcounternosection}\ifx\\#1\\\else: #1\fi}, colback=black!1, colframe=black!15, coltitle=black, fonttitle=\bfseries,boxsep=2.2mm,left=0.2em,right=0.2em,top=0.2em,bottom=0.2em,enhanced,opacityframe=.75,opacityback=1]\itshape}
{\end{tcolorbox}\par}

\newenvironment{corollary**}[1][]
{\par\refstepcounter{thmcounternosection}\begin{tcolorbox}[title={Corollary \arabic{thmcounternosection}\ifx\\#1\\\else: #1\fi}, colback=black!1, colframe=black!15, coltitle=black, fonttitle=\bfseries,boxsep=2.2mm,left=0.2em,right=0.2em,top=0.2em,bottom=0.2em,enhanced,opacityframe=.75,opacityback=1]\itshape}
{\end{tcolorbox}\par}

\newenvironment{proposition**}[1][]
{\par\refstepcounter{thmcounternosection}\begin{tcolorbox}[title={Proposition \arabic{thmcounternosection}\ifx\\#1\\\else: #1\fi}, colback=black!1, colframe=black!15, coltitle=black, fonttitle=\bfseries,boxsep=2.2mm,left=0.2em,right=0.2em,top=0.2em,bottom=0.2em,enhanced,opacityframe=.75,opacityback=1]\itshape}
{\end{tcolorbox}\par}

\newenvironment{statement**}[1][]
{\par\refstepcounter{thmcounternosection}\begin{tcolorbox}[title={Statement \arabic{thmcounternosection}\ifx\\#1\\\else: #1\fi}, colback=black!1, colframe=black!15, coltitle=black, fonttitle=\bfseries,boxsep=2.2mm,left=0.2em,right=0.2em,top=0.2em,bottom=0.2em,enhanced,opacityframe=.75,opacityback=1]\itshape}
{\end{tcolorbox}\par}

\newenvironment{conjecture**}[1][]
{\par\refstepcounter{thmcounternosection}\begin{tcolorbox}[title={Conjecture \arabic{thmcounternosection}\ifx\\#1\\\else: #1\fi}, colback=black!1, colframe=black!15, coltitle=black, fonttitle=\bfseries,boxsep=2.2mm,left=0.2em,right=0.2em,top=0.2em,bottom=0.2em,enhanced,opacityframe=.75,opacityback=1]\itshape}
{\end{tcolorbox}\par}

\newenvironment{definition**}[1][]
{\par\refstepcounter{thmcounternosection}\begin{tcolorbox}[title={Definition \arabic{thmcounternosection}\ifx\\#1\\\else: #1\fi}, colback=black!1, colframe=black!15, coltitle=black, fonttitle=\bfseries,boxsep=2.2mm,left=0.2em,right=0.2em,top=0.2em,bottom=0.2em,enhanced,opacityframe=.75,opacityback=1]\itshape}
{\end{tcolorbox}\par}

\newenvironment{problem**}[1][]
{\par\refstepcounter{thmcounternosection}\begin{tcolorbox}[title={Problem \arabic{thmcounternosection}\ifx\\#1\\\else: #1\fi}, colback=black!1, colframe=black!15, coltitle=black, fonttitle=\bfseries,boxsep=2.2mm,left=0.2em,right=0.2em,top=0.2em,bottom=0.2em,enhanced,opacityframe=.75,opacityback=1]\itshape}
{\end{tcolorbox}\par}



\endinput