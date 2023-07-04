\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{notex}[2023/07/02 NoTeX]

\DeclareOption{12pt}{\PassOptionsToClass{12pt}{amsart}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{amsart}}

\newif\ifrosstex
\DeclareOption{rosstex}{\rosstextrue}

\ProcessOptions\relax

\LoadClass{amsart}

\RequirePackage{amsmath}
\RequirePackage{amsthm}
\RequirePackage{amssymb}
\RequirePackage{float}
\RequirePackage{graphicx}
\RequirePackage{lipsum}
\RequirePackage[margin=0.7in]{geometry}
\RequirePackage{setspace}
\RequirePackage{graphicx}
\RequirePackage{tikz}
\RequirePackage{asymptote}
\RequirePackage{mathtools}
\RequirePackage{titlesec}
\RequirePackage{titletoc}
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
\definecolor{pshadegreen}{HTML}{8DAF8B}
\definecolor{pbluegreen}{HTML}{2FAE94}
\definecolor{pmidblue}{HTML}{6EB8E0}
\definecolor{pviolet}{HTML}{A868BD}
\definecolor{pvioletred}{HTML}{BD6284}
\definecolor{pyellowgreen}{HTML}{B7C635}
\definecolor{pdarkskin}{HTML}{C6A47C}
\definecolor{pdarkblue}{HTML}{0052C6}
\definecolor{pdustyellow}{HTML}{C69423}

\setstretch{1.5}
\setlength\parindent{0pt}
\setlength{\parskip}{0.5em}
\setcounter{tocdepth}{4}

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

\newcommand{\NoTeX}{N\kern-.15em\raisebox{.4ex}{\scalebox{0.84}{O}}\kern-.25em\TeX\kern.25em}
\newcommand{\RossTeX}{\tikz[baseline=(R.base)]{
    \node[draw, circle, inner sep=0pt, minimum size=1.8em] at (0em, 0) (circle) {};
    \node[inner sep=0pt] (R) at (0.01em, 0) {\raisebox{-0.4ex}{\scalebox{1.33}{R}}};
    \node[inner sep=0pt] (OSS) at (1.4em, 0.25em) {\scalebox{0.84}{OSS}};
    \node[inner sep=0pt] (TeX) at (2.85em, -0.15em) {\TeX};
  }
}

\newcommand{\floor}[1]{\left\lfloor #1 \right\rfloor}
\newcommand{\ceil}[1]{\left\lceil #1 \right\rceil}
\newcommand{\abs}[1]{\left\lvert #1 \right\rvert}
\newcommand{\norm}[1]{\left\lVert #1 \right\rVert}

\newcommand{\lecture}[1]{\gdef\@lecture{#1}}
\newcommand{\notetaker}[1]{\gdef\@notetaker{#1}}
\renewcommand{\author}[1]{\notetaker{#1}}

\newcommand{\defaultheader}{Chapter}
\newcommand{\defaultsubheader}{Module}
\newcommand{\defaultsubsubheader}{Topic}

\newcommand{\headertitle}[1]{\renewcommand{\defaultheader}{#1}}
\newcommand{\subheadertitle}[1]{\renewcommand{\defaultsubheader}{#1}}
\newcommand{\subsubheadertitle}[1]{\renewcommand{\defaultsubsubheader}{#1}}

\newenvironment{legacyproof}{\par
  \pushQED{\qed}
  \normalfont \topsep6\p@\@plus6\p@\relax
  \trivlist
  \item[\hskip\labelsep
        \itshape
    Proof\@addpunct{.}]\ignorespaces
}{
  \popQED\endtrivlist\@endpefalse
}

\let\proof\undefined
\let\endproof\undefined

\newenvironment{proof}[1][]
{\par\begin{tcolorbox}[title={\textit{Proof}\ifx\\#1\\\textit{\!.}\else\textit{\!:} #1\fi}, colback=pshadegreen!05, colframe=pshadegreen!25, coltitle=black, fonttitle=\bfseries,boxsep=2.2mm,left=0.2em,right=0.2em,top=0.2em,bottom=0.2em,enhanced,opacityframe=.75,opacityback=0.8,breakable,pad at break*=0.2em]}
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
  \fancyhead[LE,RO]{\scshape\small\thepage}
  \fancyhead[LO,RE]{\scshape\small\leftmark}
  \fancyhead[C]{\scshape\small {{\scshape\small\ifodd\value{page} {\scshape\small{\ifx\@lecture\undefined
      {{\thistitle}}
    \else
      {{Lecture {\#\@lecture}}}
    \fi}}\else {\small\@notetaker}\fi}}}
  \setlength{\headheight}{24.5042pt}
}

\pagestyle{notexstyle}

\renewcommand{\contentsname}{\normalfont\raggedright\Large\MakeUppercase{Contents}\vskip 0.4em\hrule height 0.8pt}

\titlecontents{section}
  [2.6em]
  {}
  {\large\contentslabel{2.3em}}
  {\hspace*{-2.3em}}
  {\titlerule*[1pc]{.}\contentspage}  

\titlecontents{subsection}
  [3.5em]
  {}
  {\contentslabel{2.65em}}
  {\hspace*{-2.65em}}
  {\titlerule*[1pc]{.}\contentspage}  

\titlecontents{subsubsection}
  [4.75em]
  {}
  {\contentslabel{3.3em}}
  {\hspace*{-3.3em}}
  {\titlerule*[1pc]{.}\contentspage}  

\titleformat{\section}
  {\normalfont}
  {\Large\MakeUppercase{\MakeUppercase{\defaultheader\ }\arabic{section}.}}
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
  {\defaultsubheader\ \textbf{\thesubsection}.\ }
  {0em}
  {}
  []

\titlespacing{\subsection}
  {0pt}
  {0.5ex plus 0.5ex minus 0.2ex}
  {0.5em}

\titleformat{\subsubsection}
  {\large\normalfont}
  {{\defaultsubsubheader\ \thesubsubsection}.\ }
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
{\par\refstepcounter{thmcounter}\begin{tcolorbox}[title={Theorem \thesection.\arabic{thmcounter}\ifx\\#1\\\else: #1\fi}, colback=plightred!07, colframe=plightred!28, coltitle=black, fonttitle=\bfseries,boxsep=2.2mm,left=0.2em,right=0.2em,top=0.2em,bottom=0.2em,enhanced,opacityframe=.75,opacityback=0.8,breakable,pad at break*=0.2em]}
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

\newenvironment{example}[1][]
{\par\refstepcounter{thmcounter}\begin{tcolorbox}[title={Example \thesection.\arabic{thmcounter}\ifx\\#1\\\else: #1\fi}, colback=pdustyellow!06, colframe=pdustyellow!18, coltitle=black, fonttitle=\bfseries,boxsep=2.2mm,left=0.2em,right=0.2em,top=0.2em,bottom=0.2em,enhanced,opacityframe=.75,opacityback=0.8,breakable,pad at break*=0.2em]}
{\end{tcolorbox}\par}

\newenvironment{solution}[1][]
{\par\refstepcounter{thmcounter}\begin{tcolorbox}[title={Solution \thesection.\arabic{thmcounter}\ifx\\#1\\\else: #1\fi}, colback=pdarkblue!03, colframe=pdarkblue!14, coltitle=black, fonttitle=\bfseries,boxsep=2.2mm,left=0.2em,right=0.2em,top=0.2em,bottom=0.2em,enhanced,opacityframe=.75,opacityback=0.8,breakable,pad at break*=0.2em]}
{\end{tcolorbox}\par}

\newenvironment{remark}[1][]
{\par\refstepcounter{thmcounter}\begin{tcolorbox}[title={Remark \thesection.\arabic{thmcounter}\ifx\\#1\\\else: #1\fi}, colback=pyellowgreen!08, colframe=pyellowgreen!25, coltitle=black, fonttitle=\bfseries,boxsep=2.2mm,left=0.2em,right=0.2em,top=0.2em,bottom=0.2em,enhanced,opacityframe=.75,opacityback=0.8,breakable,pad at break*=0.2em]}
{\end{tcolorbox}\par}

\newenvironment{claim}[1][]
{\par\refstepcounter{thmcounter}\begin{tcolorbox}[title={Claim \thesection.\arabic{thmcounter}\ifx\\#1\\\else: #1\fi}, colback=pviolet!06, colframe=pviolet!25, coltitle=black, fonttitle=\bfseries,boxsep=2.2mm,left=0.2em,right=0.2em,top=0.2em,bottom=0.2em,enhanced,opacityframe=.75,opacityback=0.8,breakable,pad at break*=0.2em]}
{\end{tcolorbox}\par}

\newenvironment{exercise}[1][]
{\par\refstepcounter{thmcounter}\begin{tcolorbox}[title={Exercise \thesection.\arabic{thmcounter}\ifx\\#1\\\else: #1\fi}, colback=pdarkskin!07, colframe=pdarkskin!25, coltitle=black, fonttitle=\bfseries,boxsep=2.2mm,left=0.2em,right=0.2em,top=0.2em,bottom=0.2em,enhanced,opacityframe=.75,opacityback=0.8,breakable,pad at break*=0.2em]}
{\end{tcolorbox}\par}

\newenvironment{question}[1][]
{\par\refstepcounter{thmcounter}\begin{tcolorbox}[title={Question \thesection.\arabic{thmcounter}\ifx\\#1\\\else: #1\fi}, colback=pbluegreen!08, colframe=pbluegreen!25, coltitle=black, fonttitle=\bfseries,boxsep=2.2mm,left=0.2em,right=0.2em,top=0.2em,bottom=0.2em,enhanced,opacityframe=.75,opacityback=0.8,breakable,pad at break*=0.2em]}
{\end{tcolorbox}\par}

\newenvironment{fact}[1][]
{\par\refstepcounter{thmcounter}\begin{tcolorbox}[title={Fact \thesection.\arabic{thmcounter}\ifx\\#1\\\else: #1\fi}, colback=pvioletred!08, colframe=pvioletred!25, coltitle=black, fonttitle=\bfseries,boxsep=2.2mm,left=0.2em,right=0.2em,top=0.2em,bottom=0.2em,enhanced,opacityframe=.75,opacityback=0.8,breakable,pad at break*=0.2em]}
{\end{tcolorbox}\par}

%END THM FORMAT

%BEGIN THM BUILD

\newenvironment{theorem*}[1][]
{\par\begin{tcolorbox}[title={Theorem\ifx\\#1\\\else: #1\fi}, colback=plightred!07, colframe=plightred!28, coltitle=black, fonttitle=\bfseries,boxsep=2.2mm,left=0.2em,right=0.2em,top=0.2em,bottom=0.2em,enhanced,opacityframe=.75,opacityback=0.8,breakable,pad at break*=0.2em]}
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

\newenvironment{example*}[1][]
{\par\begin{tcolorbox}[title={Example\ifx\\#1\\\else: #1\fi}, colback=pdustyellow!06, colframe=pdustyellow!18, coltitle=black, fonttitle=\bfseries,boxsep=2.2mm,left=0.2em,right=0.2em,top=0.2em,bottom=0.2em,enhanced,opacityframe=.75,opacityback=0.8,breakable,pad at break*=0.2em]}
{\end{tcolorbox}\par}

\newenvironment{solution*}[1][]
{\par\begin{tcolorbox}[title={Solution\ifx\\#1\\\else: #1\fi}, colback=pdarkblue!03, colframe=pdarkblue!14, coltitle=black, fonttitle=\bfseries,boxsep=2.2mm,left=0.2em,right=0.2em,top=0.2em,bottom=0.2em,enhanced,opacityframe=.75,opacityback=0.8,breakable,pad at break*=0.2em]}
{\end{tcolorbox}\par}

\newenvironment{remark*}[1][]
{\par\begin{tcolorbox}[title={Remark\ifx\\#1\\\else: #1\fi}, colback=pyellowgreen!08, colframe=pyellowgreen!25, coltitle=black, fonttitle=\bfseries,boxsep=2.2mm,left=0.2em,right=0.2em,top=0.2em,bottom=0.2em,enhanced,opacityframe=.75,opacityback=0.8,breakable,pad at break*=0.2em]}
{\end{tcolorbox}\par}

\newenvironment{claim*}[1][]
{\par\begin{tcolorbox}[title={Claim\ifx\\#1\\\else: #1\fi}, colback=pviolet!06, colframe=pviolet!25, coltitle=black, fonttitle=\bfseries,boxsep=2.2mm,left=0.2em,right=0.2em,top=0.2em,bottom=0.2em,enhanced,opacityframe=.75,opacityback=0.8,breakable,pad at break*=0.2em]}
{\end{tcolorbox}\par}

\newenvironment{exercise*}[1][]
{\par\begin{tcolorbox}[title={Exercise\ifx\\#1\\\else: #1\fi}, colback=pdarkskin!07, colframe=pdarkskin!25, coltitle=black, fonttitle=\bfseries,boxsep=2.2mm,left=0.2em,right=0.2em,top=0.2em,bottom=0.2em,enhanced,opacityframe=.75,opacityback=0.8,breakable,pad at break*=0.2em]}
{\end{tcolorbox}\par}

\newenvironment{question*}[1][]
{\par\begin{tcolorbox}[title={Question\ifx\\#1\\\else: #1\fi}, colback=pbluegreen!08, colframe=pbluegreen!25, coltitle=black, fonttitle=\bfseries,boxsep=2.2mm,left=0.2em,right=0.2em,top=0.2em,bottom=0.2em,enhanced,opacityframe=.75,opacityback=0.8,breakable,pad at break*=0.2em]}
{\end{tcolorbox}\par}

\newenvironment{fact*}[1][]
{\par\begin{tcolorbox}[title={Fact\ifx\\#1\\\else: #1\fi}, colback=pvioletred!08, colframe=pvioletred!25, coltitle=black, fonttitle=\bfseries,boxsep=2.2mm,left=0.2em,right=0.2em,top=0.2em,bottom=0.2em,enhanced,opacityframe=.75,opacityback=0.8,breakable,pad at break*=0.2em]}
{\end{tcolorbox}\par}


\newenvironment{theorem**}[1][]
{\par\refstepcounter{thmcounternosection}\begin{tcolorbox}[title={Theorem \arabic{thmcounternosection}\ifx\\#1\\\else: #1\fi}, colback=plightred!07, colframe=plightred!28, coltitle=black, fonttitle=\bfseries,boxsep=2.2mm,left=0.2em,right=0.2em,top=0.2em,bottom=0.2em,enhanced,opacityframe=.75,opacityback=0.8,breakable,pad at break*=0.2em]}
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

\newenvironment{example**}[1][]
{\par\refstepcounter{thmcounternosection}\begin{tcolorbox}[title={Example \arabic{thmcounternosection}\ifx\\#1\\\else: #1\fi}, colback=pdustyellow!06, colframe=pdustyellow!18, coltitle=black, fonttitle=\bfseries,boxsep=2.2mm,left=0.2em,right=0.2em,top=0.2em,bottom=0.2em,enhanced,opacityframe=.75,opacityback=0.8,breakable,pad at break*=0.2em]}
{\end{tcolorbox}\par}

\newenvironment{solution**}[1][]
{\par\refstepcounter{thmcounternosection}\begin{tcolorbox}[title={Solution \arabic{thmcounternosection}\ifx\\#1\\\else: #1\fi}, colback=pdarkblue!03, colframe=pdarkblue!14, coltitle=black, fonttitle=\bfseries,boxsep=2.2mm,left=0.2em,right=0.2em,top=0.2em,bottom=0.2em,enhanced,opacityframe=.75,opacityback=0.8,breakable,pad at break*=0.2em]}
{\end{tcolorbox}\par}

\newenvironment{remark**}[1][]
{\par\refstepcounter{thmcounternosection}\begin{tcolorbox}[title={Remark \arabic{thmcounternosection}\ifx\\#1\\\else: #1\fi}, colback=pyellowgreen!08, colframe=pyellowgreen!25, coltitle=black, fonttitle=\bfseries,boxsep=2.2mm,left=0.2em,right=0.2em,top=0.2em,bottom=0.2em,enhanced,opacityframe=.75,opacityback=0.8,breakable,pad at break*=0.2em]}
{\end{tcolorbox}\par}

\newenvironment{claim**}[1][]
{\par\refstepcounter{thmcounternosection}\begin{tcolorbox}[title={Claim \arabic{thmcounternosection}\ifx\\#1\\\else: #1\fi}, colback=pviolet!06, colframe=pviolet!25, coltitle=black, fonttitle=\bfseries,boxsep=2.2mm,left=0.2em,right=0.2em,top=0.2em,bottom=0.2em,enhanced,opacityframe=.75,opacityback=0.8,breakable,pad at break*=0.2em]}
{\end{tcolorbox}\par}

\newenvironment{exercise**}[1][]
{\par\refstepcounter{thmcounternosection}\begin{tcolorbox}[title={Exercise \arabic{thmcounternosection}\ifx\\#1\\\else: #1\fi}, colback=pdarkskin!07, colframe=pdarkskin!25, coltitle=black, fonttitle=\bfseries,boxsep=2.2mm,left=0.2em,right=0.2em,top=0.2em,bottom=0.2em,enhanced,opacityframe=.75,opacityback=0.8,breakable,pad at break*=0.2em]}
{\end{tcolorbox}\par}

\newenvironment{question**}[1][]
{\par\refstepcounter{thmcounternosection}\begin{tcolorbox}[title={Question \arabic{thmcounternosection}\ifx\\#1\\\else: #1\fi}, colback=pbluegreen!08, colframe=pbluegreen!25, coltitle=black, fonttitle=\bfseries,boxsep=2.2mm,left=0.2em,right=0.2em,top=0.2em,bottom=0.2em,enhanced,opacityframe=.75,opacityback=0.8,breakable,pad at break*=0.2em]}
{\end{tcolorbox}\par}

\newenvironment{fact**}[1][]
{\par\refstepcounter{thmcounternosection}\begin{tcolorbox}[title={Fact \arabic{thmcounternosection}\ifx\\#1\\\else: #1\fi}, colback=pvioletred!08, colframe=pvioletred!25, coltitle=black, fonttitle=\bfseries,boxsep=2.2mm,left=0.2em,right=0.2em,top=0.2em,bottom=0.2em,enhanced,opacityframe=.75,opacityback=0.8,breakable,pad at break*=0.2em]}
{\end{tcolorbox}\par}

%END THM BUILD

\ifrosstex
\newcommand{\enablerosslogo}{
  \RequirePackage{background}
  \backgroundsetup{
    scale=2.4,
    opacity=0.075,
    angle=0,
    contents={\includegraphics{res/rosslogo.pdf}}
  }
}

\newcommand{\psetnum}[1]{\gdef\@psetnum{#1}}
\newcommand{\solver}[1]{\gdef\@solver{#1}}
\renewcommand{\author}[1]{\solver{#1}}
\let\lecture\relax
\let\notetaker\relax
\def\@lecture{}
\def\@notetaker{}

\let\subheadertitle\relax
\let\subsubheadertitle\relax

\renewcommand{\@maketitle}{
  \newpage
  \null
  \vspace{-0.5in}
  \begin{center}
    \let\footnote\@date
    \ifx\@psetnum\undefined
      {\large\bfseries\MakeUppercase{\@title} \par}
    \else
      {\large\bfseries\MakeUppercase{Problem Set {\#\@psetnum}} \par}
    \fi
    \vskip 0.25em
    \ifx\@solver\undefined
      {}
    \else
      {\large\MakeUppercase{\@solver}}
    \fi
    \vskip 0.1em
    {\let\thefootnote\relax\footnotetext{\textit{Date}: \@date}}
  \end{center}
  \par
  \vspace{0.4in}
}

\fancypagestyle{rosstexstyle}{
  \fancyhf{}
  \renewcommand{\headrulewidth}{0pt}
  \fancyhead[LE,RO]{\scshape\small\thepage}
  \fancyhead[LO,RE]{\scshape\small\@date}
  \fancyhead[C]{\scshape\small {{\scshape\small\ifodd\value{page} {\ifx\@psetnum\undefined
      {\small{\thistitle}}
    \else
      {\small{Problem Set {\#\@psetnum}}}
    \fi}\else {\small\@solver}\fi}}}

  \setlength{\headheight}{24.5042pt}
}

\pagestyle{rosstexstyle}

\renewcommand{\defaultheader}{Problem}

\titleformat{\subsection}[runin]
  {\normalfont\bfseries}
  {\textbf{(\alph{subsection})}\ }
  {0em}
  {}
  [.]

\titleformat{\subsubsection}[runin]
  {\normalfont}
  {{(\textit{\roman{subsection}})}\ }
  {0em}
  {\itshape}
  [.]
\else
\fi

\endinput
