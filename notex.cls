\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{notex}[2023/07/02 NoTeX]

\DeclareOption{12pt}{\PassOptionsToClass{12pt}{amsart}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{amsart}}
\ProcessOptions\relax

\LoadClass{amsart}

\RequirePackage{amsmath}
\RequirePackage{amsthm}
\RequirePackage{amssymb}
\RequirePackage{float}
\RequirePackage{graphicx}
\RequirePackage{lipsum}
\RequirePackage[margin=0.75in]{geometry}
\RequirePackage{setspace}
\RequirePackage{graphicx}
\RequirePackage{tikz}
\RequirePackage{mathtools}
\RequirePackage{titlesec}
\RequirePackage{fancyhdr}
\RequirePackage{pdfpages}
\RequirePackage{xcolor}
\RequirePackage{etoolbox}
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
\definecolor{porange}{HTML}{FF9400}
\definecolor{pmagenta}{HTML}{EE5FA7}
\definecolor{plightorange}{HTML}{F9CB9C}
\definecolor{pgold}{HTML}{EFB219}
\definecolor{plavender}{HTML}{F4BBFF}
\definecolor{psalmon}{HTML}{FA8072}
\definecolor{pdarkred}{HTML}{CC4125}
\definecolor{pshadegreen}{HTML}{AFAAA4}

\setstretch{1.5}
\setlength\parindent{0pt}
\setlength{\parskip}{0.5em}

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

\newcommand{\NoTeX}{N\kern-.05em\raisebox{.4ex}{\scalebox{0.84}{O}}\kern-.05em\TeX}
\newcommand{\RossTeX}{\tikz[baseline=(R.base)]{
    \node[draw, circle, inner sep=0pt, minimum size=1.8em] at (0em, 0) (circle) {};
    \node[inner sep=0pt] (R) at (0.01em, 0) {\raisebox{-0.4ex}{\scalebox{1.33}{$\mathbb{R}$}}};
    \node[inner sep=0pt] (OSS) at (1.4em, 0.25em) {\scalebox{0.84}{OSS}};
    \node[inner sep=0pt] (TeX) at (2.8em, -0.15em) {\TeX};
}}

\newcommand{\floor}[1]{\left\lfloor #1 \right\rfloor}
\newcommand{\ceil}[1]{\left\lceil #1 \right\rceil}
\newcommand{\abs}[1]{\left\lvert #1 \right\rvert}
\newcommand{\norm}[1]{\left\lVert #1 \right\rVert}

\newcommand{\lecture}[1]{\gdef\@lecture{#1}}
\newcommand{\notetaker}[1]{\gdef\@notetaker{#1}}
\renewcommand{\author}[1]{\notetaker{#1}}

\let\originalproof\proof
\let\endoriginalproof\endproof
\newenvironment{legacyproof}{
  \begin{originalproof}
}{
  \end{originalproof}
}
\let\proof\undefined
\let\endproof\undefined

\newenvironment{proof}
{\par\begin{tcolorbox}[title={\textit{Proof.}}, colback=pshadegreen!05, colframe=pshadegreen!25, coltitle=black, fonttitle=\bfseries,boxsep=2.2mm,left=0.2em,right=0.2em,top=0.2em,bottom=0.2em,enhanced,opacityframe=.75,opacityback=0.8,breakable,pad at break*=0.2em]}
{\hfill \qedsymbol\end{tcolorbox}\par}

\renewcommand{\@maketitle}{
  \newpage
  \null
  \vspace{-0.5in}
  \begin{center}
    \let\footnote\@date
    \ifx\@lecture\undefined
      {\large\bfseries\MakeUppercase{\@title} \par}
    \else
      {\large\bfseries\MakeUppercase{Lecture {\#\@lecture}} \par}
    \fi
    \vskip 0.25em
    \ifx\@notetaker\undefined
      {}
    \else
      {\large\MakeUppercase{\@notetaker}}
    \fi
    \vskip 0.1em
    {\let\thefootnote\relax\footnotetext{\textit{Date}: \@date}}
  \end{center}
  \par
  \vspace{0.4in}
}

\renewcommand{\sectionmark}[1]{\markboth{#1}{}}
\renewcommand{\refname}{\MakeUppercase{References}}

\fancypagestyle{notexstyle}{
  \fancyhf{}
  \renewcommand{\headrulewidth}{0pt}
  \fancyhead[LE,RO]{\small\thepage}
  \fancyhead[C]{\scshape\small {{\scshape\small\ifodd\value{page} {\small\leftmark}\else {\small\@notetaker}\fi}}}

  \setlength{\headheight}{24.5042pt}
}

\pagestyle{notexstyle}

\titleformat{\section}
  {\normalfont}
  {\Large\MakeUppercase{\MakeUppercase{Chapter }\arabic{section}.}}
  {0.4em}
  {\Large}
  [{\titlerule[0.8pt]\smallskip}]

\titleformat{name=\section,numberless}
  {\normalfont}
  {\Large}
  {0em}
  {\Large}
  [{\titlerule[0.8pt]\smallskip}]

\titleformat{\subsection}
  {\large\normalfont\bfseries}
  {Module \textbf{\thesubsection}.\ }
  {0em}
  {}
  []

\titlespacing{\subsection}
  {0pt}
  {0.5ex plus 0.5ex minus 0.2ex}
  {0.5em}

\titleformat{\subsubsection}
  {\large\normalfont}
  {{Topic \thesubsubsection}.\ }
  {0em}
  {}
  []

\titlespacing{\subsubsection}
  {0pt}
  {0.5ex plus 0.5ex minus 0.2ex}
  {0.5em}

\renewcommand{\appendix}{
\setcounter{section}{0}
\renewcommand{\thesection}{\Alph{section}}
\titleformat{\section}
  {\normalfont}
  {\Large\MakeUppercase{Appendix \thesection. }}
  {0em}
  {\Large}
  [{\titlerule[0.8pt]\smallskip}]
\titleformat{name=\section,numberless}
  {\normalfont}
  {\Large\MakeUppercase{\MakeUppercase{Appendix}.\ }}
  {0em}
  {\Large}
  [{\titlerule[0.8pt]\smallskip}]
}

\newcounter{thmcounter}[section]
\newcounter{thmcounternosection}

\renewcommand{\thethmcounter}{\thesection.\arabic{thmcounter}}

%BEGIN THM FORMAT

\newenvironment{theorem}[1][]
{\par\refstepcounter{thmcounter}\begin{tcolorbox}[title={Theorem \thesection.\arabic{thmcounter}\ifx\\#1\\\else: #1\fi}, colback=plightred!04, colframe=plightred!25, coltitle=black, fonttitle=\bfseries,boxsep=2.2mm,left=0.2em,right=0.2em,top=0.2em,bottom=0.2em,enhanced,opacityframe=.75,opacityback=0.8,breakable,pad at break*=0.2em]}
{\end{tcolorbox}\par}

\newenvironment{lemma}[1][]
{\par\refstepcounter{thmcounter}\begin{tcolorbox}[title={Lemma \thesection.\arabic{thmcounter}\ifx\\#1\\\else: #1\fi}, colback=porange!04, colframe=porange!25, coltitle=black, fonttitle=\bfseries,boxsep=2.2mm,left=0.2em,right=0.2em,top=0.2em,bottom=0.2em,enhanced,opacityframe=.75,opacityback=0.8,breakable,pad at break*=0.2em]}
{\end{tcolorbox}\par}

\newenvironment{corollary}[1][]
{\par\refstepcounter{thmcounter}\begin{tcolorbox}[title={Corollary \thesection.\arabic{thmcounter}\ifx\\#1\\\else: #1\fi}, colback=pgold!04, colframe=pgold!25, coltitle=black, fonttitle=\bfseries,boxsep=2.2mm,left=0.2em,right=0.2em,top=0.2em,bottom=0.2em,enhanced,opacityframe=.75,opacityback=0.8,breakable,pad at break*=0.2em]}
{\end{tcolorbox}\par}

\newenvironment{proposition}[1][]
{\par\refstepcounter{thmcounter}\begin{tcolorbox}[title={Proposition \thesection.\arabic{thmcounter}\ifx\\#1\\\else: #1\fi}, colback=plavender!08, colframe=plavender!35, coltitle=black, fonttitle=\bfseries,boxsep=2.2mm,left=0.2em,right=0.2em,top=0.2em,bottom=0.2em,enhanced,opacityframe=.75,opacityback=0.8,breakable,pad at break*=0.2em]}
{\end{tcolorbox}\par}

\newenvironment{statement}[1][]
{\par\refstepcounter{thmcounter}\begin{tcolorbox}[title={Statement \thesection.\arabic{thmcounter}\ifx\\#1\\\else: #1\fi}, colback=pmagenta!04, colframe=pmagenta!25, coltitle=black, fonttitle=\bfseries,boxsep=2.2mm,left=0.2em,right=0.2em,top=0.2em,bottom=0.2em,enhanced,opacityframe=.75,opacityback=0.8,breakable,pad at break*=0.2em]}
{\end{tcolorbox}\par}

\newenvironment{conjecture}[1][]
{\par\refstepcounter{thmcounter}\begin{tcolorbox}[title={Conjecture \thesection.\arabic{thmcounter}\ifx\\#1\\\else: #1\fi}, colback=pdarkred!04, colframe=pdarkred!15, coltitle=black, fonttitle=\bfseries,boxsep=2.2mm,left=0.2em,right=0.2em,top=0.2em,bottom=0.2em,enhanced,opacityframe=.75,opacityback=0.8,breakable,pad at break*=0.2em]}
{\end{tcolorbox}\par}

\newenvironment{definition}[1][]
{\par\refstepcounter{thmcounter}\begin{tcolorbox}[title={Definition \thesection.\arabic{thmcounter}\ifx\\#1\\\else: #1\fi}, colback=plightblue!16, colframe=plightblue!45, coltitle=black, fonttitle=\bfseries,boxsep=2.2mm,left=0.2em,right=0.2em,top=0.2em,bottom=0.2em,enhanced,opacityframe=.75,opacityback=0.8,breakable,pad at break*=0.2em]}
{\end{tcolorbox}\par}

\newenvironment{problem}[1][]
{\par\refstepcounter{thmcounter}\begin{tcolorbox}[title={Problem \thesection.\arabic{thmcounter}\ifx\\#1\\\else: #1\fi}, colback=plightgreen!18, colframe=plightgreen!65, coltitle=black, fonttitle=\bfseries,boxsep=2.2mm,left=0.2em,right=0.2em,top=0.2em,bottom=0.2em,enhanced,opacityframe=.75,opacityback=0.8,breakable,pad at break*=0.2em]}
{\end{tcolorbox}\par}

%END THM FORMAT

%BEGIN THM BUILD

\newenvironment{theorem*}[1][]
{\par\begin{tcolorbox}[title={Theorem\ifx\\#1\\\else: #1\fi}, colback=plightred!04, colframe=plightred!25, coltitle=black, fonttitle=\bfseries,boxsep=2.2mm,left=0.2em,right=0.2em,top=0.2em,bottom=0.2em,enhanced,opacityframe=.75,opacityback=0.8,breakable,pad at break*=0.2em]}
{\end{tcolorbox}\par}

\newenvironment{lemma*}[1][]
{\par\begin{tcolorbox}[title={Lemma\ifx\\#1\\\else: #1\fi}, colback=porange!04, colframe=porange!25, coltitle=black, fonttitle=\bfseries,boxsep=2.2mm,left=0.2em,right=0.2em,top=0.2em,bottom=0.2em,enhanced,opacityframe=.75,opacityback=0.8,breakable,pad at break*=0.2em]}
{\end{tcolorbox}\par}

\newenvironment{corollary*}[1][]
{\par\begin{tcolorbox}[title={Corollary\ifx\\#1\\\else: #1\fi}, colback=pgold!04, colframe=pgold!25, coltitle=black, fonttitle=\bfseries,boxsep=2.2mm,left=0.2em,right=0.2em,top=0.2em,bottom=0.2em,enhanced,opacityframe=.75,opacityback=0.8,breakable,pad at break*=0.2em]}
{\end{tcolorbox}\par}

\newenvironment{proposition*}[1][]
{\par\begin{tcolorbox}[title={Proposition\ifx\\#1\\\else: #1\fi}, colback=plavender!08, colframe=plavender!35, coltitle=black, fonttitle=\bfseries,boxsep=2.2mm,left=0.2em,right=0.2em,top=0.2em,bottom=0.2em,enhanced,opacityframe=.75,opacityback=0.8,breakable,pad at break*=0.2em]}
{\end{tcolorbox}\par}

\newenvironment{statement*}[1][]
{\par\begin{tcolorbox}[title={Statement\ifx\\#1\\\else: #1\fi}, colback=pmagenta!04, colframe=pmagenta!25, coltitle=black, fonttitle=\bfseries,boxsep=2.2mm,left=0.2em,right=0.2em,top=0.2em,bottom=0.2em,enhanced,opacityframe=.75,opacityback=0.8,breakable,pad at break*=0.2em]}
{\end{tcolorbox}\par}

\newenvironment{conjecture*}[1][]
{\par\begin{tcolorbox}[title={Conjecture\ifx\\#1\\\else: #1\fi}, colback=pdarkred!04, colframe=pdarkred!15, coltitle=black, fonttitle=\bfseries,boxsep=2.2mm,left=0.2em,right=0.2em,top=0.2em,bottom=0.2em,enhanced,opacityframe=.75,opacityback=0.8,breakable,pad at break*=0.2em]}
{\end{tcolorbox}\par}

\newenvironment{definition*}[1][]
{\par\begin{tcolorbox}[title={Definition\ifx\\#1\\\else: #1\fi}, colback=plightblue!16, colframe=plightblue!45, coltitle=black, fonttitle=\bfseries,boxsep=2.2mm,left=0.2em,right=0.2em,top=0.2em,bottom=0.2em,enhanced,opacityframe=.75,opacityback=0.8,breakable,pad at break*=0.2em]}
{\end{tcolorbox}\par}

\newenvironment{problem*}[1][]
{\par\begin{tcolorbox}[title={Problem\ifx\\#1\\\else: #1\fi}, colback=plightgreen!18, colframe=plightgreen!65, coltitle=black, fonttitle=\bfseries,boxsep=2.2mm,left=0.2em,right=0.2em,top=0.2em,bottom=0.2em,enhanced,opacityframe=.75,opacityback=0.8,breakable,pad at break*=0.2em]}
{\end{tcolorbox}\par}


\newenvironment{theorem**}[1][]
{\par\refstepcounter{thmcounternosection}\begin{tcolorbox}[title={Theorem \arabic{thmcounternosection}\ifx\\#1\\\else: #1\fi}, colback=plightred!04, colframe=plightred!25, coltitle=black, fonttitle=\bfseries,boxsep=2.2mm,left=0.2em,right=0.2em,top=0.2em,bottom=0.2em,enhanced,opacityframe=.75,opacityback=0.8,breakable,pad at break*=0.2em]}
{\end{tcolorbox}\par}

\newenvironment{lemma**}[1][]
{\par\refstepcounter{thmcounternosection}\begin{tcolorbox}[title={Lemma \arabic{thmcounternosection}\ifx\\#1\\\else: #1\fi}, colback=porange!04, colframe=porange!25, coltitle=black, fonttitle=\bfseries,boxsep=2.2mm,left=0.2em,right=0.2em,top=0.2em,bottom=0.2em,enhanced,opacityframe=.75,opacityback=0.8,breakable,pad at break*=0.2em]}
{\end{tcolorbox}\par}

\newenvironment{corollary**}[1][]
{\par\refstepcounter{thmcounternosection}\begin{tcolorbox}[title={Corollary \arabic{thmcounternosection}\ifx\\#1\\\else: #1\fi}, colback=pgold!04, colframe=pgold!25, coltitle=black, fonttitle=\bfseries,boxsep=2.2mm,left=0.2em,right=0.2em,top=0.2em,bottom=0.2em,enhanced,opacityframe=.75,opacityback=0.8,breakable,pad at break*=0.2em]}
{\end{tcolorbox}\par}

\newenvironment{proposition**}[1][]
{\par\refstepcounter{thmcounternosection}\begin{tcolorbox}[title={Proposition \arabic{thmcounternosection}\ifx\\#1\\\else: #1\fi}, colback=plavender!08, colframe=plavender!35, coltitle=black, fonttitle=\bfseries,boxsep=2.2mm,left=0.2em,right=0.2em,top=0.2em,bottom=0.2em,enhanced,opacityframe=.75,opacityback=0.8,breakable,pad at break*=0.2em]}
{\end{tcolorbox}\par}

\newenvironment{statement**}[1][]
{\par\refstepcounter{thmcounternosection}\begin{tcolorbox}[title={Statement \arabic{thmcounternosection}\ifx\\#1\\\else: #1\fi}, colback=pmagenta!04, colframe=pmagenta!25, coltitle=black, fonttitle=\bfseries,boxsep=2.2mm,left=0.2em,right=0.2em,top=0.2em,bottom=0.2em,enhanced,opacityframe=.75,opacityback=0.8,breakable,pad at break*=0.2em]}
{\end{tcolorbox}\par}

\newenvironment{conjecture**}[1][]
{\par\refstepcounter{thmcounternosection}\begin{tcolorbox}[title={Conjecture \arabic{thmcounternosection}\ifx\\#1\\\else: #1\fi}, colback=pdarkred!04, colframe=pdarkred!15, coltitle=black, fonttitle=\bfseries,boxsep=2.2mm,left=0.2em,right=0.2em,top=0.2em,bottom=0.2em,enhanced,opacityframe=.75,opacityback=0.8,breakable,pad at break*=0.2em]}
{\end{tcolorbox}\par}

\newenvironment{definition**}[1][]
{\par\refstepcounter{thmcounternosection}\begin{tcolorbox}[title={Definition \arabic{thmcounternosection}\ifx\\#1\\\else: #1\fi}, colback=plightblue!16, colframe=plightblue!45, coltitle=black, fonttitle=\bfseries,boxsep=2.2mm,left=0.2em,right=0.2em,top=0.2em,bottom=0.2em,enhanced,opacityframe=.75,opacityback=0.8,breakable,pad at break*=0.2em]}
{\end{tcolorbox}\par}

\newenvironment{problem**}[1][]
{\par\refstepcounter{thmcounternosection}\begin{tcolorbox}[title={Problem \arabic{thmcounternosection}\ifx\\#1\\\else: #1\fi}, colback=plightgreen!18, colframe=plightgreen!65, coltitle=black, fonttitle=\bfseries,boxsep=2.2mm,left=0.2em,right=0.2em,top=0.2em,bottom=0.2em,enhanced,opacityframe=.75,opacityback=0.8,breakable,pad at break*=0.2em]}
{\end{tcolorbox}\par}

%END THM BUILD

\endinput
