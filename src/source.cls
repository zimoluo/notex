\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{notex}[2023/07/02 NoTeX]

\PassOptionsToClass{reqno}{amsart}

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
\RequirePackage{tikz}
\RequirePackage{asymptote}
\RequirePackage{mathtools}
\RequirePackage{titlesec}
\RequirePackage{titletoc}
\RequirePackage{fancyhdr}
\RequirePackage{pdfpages}
\RequirePackage{xcolor}
\RequirePackage{xparse}
\RequirePackage{etoolbox}
\RequirePackage{calc}
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

% BEGIN COLORS

% END COLORS

\setstretch{1.24}
\setlength\parindent{1.6em}
\setlength{\parskip}{0.35em}
\setcounter{tocdepth}{4}

\usetikzlibrary{arrows,scopes,positioning,cd,calc}

\title{\@ifundefined{title}{}{\@title}}

\DeclareMathOperator{\lcm}{lcm}
\DeclareMathOperator{\ord}{ord}
\DeclareMathOperator{\Ker}{ker}
\DeclareMathOperator{\kernel}{ker}
\DeclareMathOperator{\Aut}{Aut}
\DeclareMathOperator{\Hom}{Hom}
\DeclareMathOperator{\Mor}{Mor}
\DeclareMathOperator{\GL}{GL}
\DeclareMathOperator{\SL}{SL}
\DeclareMathOperator{\im}{im}

\newcommand{\C}{\mathbb{C}}
\newcommand{\N}{\mathbb{N}}
\newcommand{\Q}{\mathbb{Q}}
\newcommand{\R}{\mathbb{R}}
\newcommand{\U}{\mathbb{U}}
\newcommand{\Z}{\mathbb{Z}}
\newcommand{\Zplus}{\mathbb{Z}^{+}}
\newcommand{\Line}{\mathcal{L}}

\newcommand{\disfrac}[2]{\displaystyle\frac{#1}{#2}}

\providecommand{\forcedisfrac}{
  \ifdefined\oldfrac\relax
    \renewcommand{\frac}[2]{\displaystyle\oldfrac{##1}{##2}}
  \else
    \let\oldfrac\frac
    \renewcommand{\frac}[2]{\displaystyle\oldfrac{##1}{##2}}
  \fi
}

\newcommand{\forcedisplaymath}{
  \everymath{\displaystyle}
}

\newcommand{\IncludeFile}[1] {
  \input{Chapter_#1}
  \newpage
}

\newcommand{\IncludeFiles}[2] {
  \foreach \n in {#1,...,#2} {
      \IncludeFile{\n}
    }
}

\newcommand{\bracket}[1]{\left[#1\right]}
\newcommand{\curlybracket}[1]{\left\{#1\right\}}
\newcommand{\curb}[1]{\curleybracket{#1}}
\newcommand{\parenthesis}[1]{\left(#1\right)}
\newcommand{\paren}[1]{\parenthesis{#1}}
\newcommand{\vertlines}[1]{\left\lvert#1\right\rvert}
\newcommand{\angles}[1]{\left\langle#1\right\rangle}
\newcommand{\legendre}[2]{\parenthesis{\frac{#1}{#2}}}

\newcommand{\vecdouble}[2]{\displaystyle\begin{bmatrix}#1 \\ #2 \end{bmatrix}}
\newcommand{\vecd}[2]{\vecdouble{#1}{#2}}
\newcommand{\vectriple}[3]{\displaystyle\begin{bmatrix}#1 \\ #2 \\ #3 \end{bmatrix}}
\newcommand{\vect}[3]{\vectriple{#1}{#2}{#3}}

\newcommand{\eps}{\varepsilon}

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

\newcommand{\titlekeyword}{Lecture}
\newcommand{\lecture}[1]{\title{\titlekeyword\ \##1}}
\newcommand{\altauthor}[1]{\gdef\@altauthor{#1}}
\renewcommand{\author}[1]{\altauthor{#1}}

\newcommand{\defaultheader}{Chapter}
\newcommand{\defaultsubheader}{Module}
\newcommand{\defaultsubsubheader}{Topic}

\newcommand{\headertitle}[1]{\renewcommand{\defaultheader}{#1}}
\newcommand{\subheadertitle}[1]{\renewcommand{\defaultsubheader}{#1}}
\newcommand{\subsubheadertitle}[1]{\renewcommand{\defaultsubsubheader}{#1}}

\newlength{\headerlengthmiddle}
\setlength{\headerlengthmiddle}{(\paperwidth - \oddsidemargin - \evensidemargin)/3}
\newlength{\headerlengthside}
\setlength{\headerlengthside}{(\paperwidth - \oddsidemargin - \evensidemargin)/5}

\newcommand{\thistitle}{}
\renewcommand{\title}[1]{\renewcommand{\thistitle}{#1}}

\gdef\@title{\thistitle}

\newcommand{\enablerosslogo}{
  \RequirePackage{background}
  \backgroundsetup{
    scale=2.4,
    opacity=0.075,
    angle=0,
    contents={\includegraphics{res/rosslogo.pdf}}
  }
}

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
{\par\begin{tcolorbox}[title={\ifx\\#1\\\textit{Proof.}\else\textit{Proof:} #1\textit{.}\fi}, attach title to upper={\ }, nobeforeafter, after=\vspace{0.2em}, before=\vspace{0.2em}, colback=psilver!15, colframe=psilver!65, coltitle=black, fonttitle=\bfseries, boxsep=0.45em, left=0.2em, right=0.2em, top=0.2em, bottom=0.2em, enhanced, opacityframe=0.8, opacityback=0.8, breakable, pad at break*=0.2em]}
    {\hfill \qedsymbol\end{tcolorbox}\par}

\renewcommand{\@maketitle}{
  \gdef\@title{\thistitle}
  \newpage
  \null
  \vspace{-2.5em}
  \begin{center}
    \let\footnote\@date
    {\large\bfseries\MakeUppercase{\thistitle} \par}
    \vskip 0.25em
    \ifx\@altauthor\undefined
      {}
      \else
      {\large\MakeUppercase{\@altauthor}}
    \fi
    \vskip 0.1em
      {\let\thefootnote\relax\footnotetext{\textit{Date}: \@date}}
  \end{center}
  \par
  \vspace{0.7em}
}

\NewDocumentCommand{\customtitle}{mmmo}{
  \newpage
  \null
  \addtocontents{toc}{\protect\hspace*{-1.6em}\protect\rule{\textwidth}{0.5pt}}
  \thispagestyle{plain}
  \regularsection
  \ifx\relax#3\relax
  \else
    \gdef\@date{#3}
  \fi
  \gdef\@altauthor{#2}
  \ifx f#4
    \renewcommand{\thistitle}{\titlekeyword\ \##1}
  \else
    \renewcommand{\thistitle}{#1}
  \fi
  \setcounter{section}{0}
  \setcounter{thmcounter}{0}
  \setcounter{thmcounternosection}{0}
  \vspace{-2.5em}
  \begin{center}
    \let\footnote\@date
    {\large\bfseries\MakeUppercase{\thistitle} \par}
    \vskip 0.25em
      {\large\MakeUppercase{#2}}
    \vskip 0.1em
      {\let\thefootnote\relax\footnotetext{\textit{Date}: \@date}}
  \end{center}
  \par
  \vspace{0.7em}
}

\renewcommand{\sectionmark}[1]{\markboth{#1}{}}
\renewcommand{\refname}{\scshape{References}}

\fancypagestyle{notexstyle}{
  \fancyhf{}
  \renewcommand{\headrulewidth}{0pt}
  \fancyhead[LE,RO]{\scshape\small\thepage}
  \fancyhead[LO]{\begin{tabular}{p{\headerlengthside}}\raggedright\scshape\small\leftmark\end{tabular}}
  \fancyhead[RE]{\begin{tabular}{p{\headerlengthside}}\raggedleft\scshape\small\leftmark\end{tabular}}
  \fancyhead[C]{\begin{tabular}{p{\headerlengthmiddle}}\centering\scshape\small {{\scshape\small\ifodd\value{page} {\scshape\small{{\thistitle}}}\else {\small\@altauthor}\fi}}\end{tabular}}
  \setlength{\headheight}{24.5042pt}
}

\pagestyle{notexstyle}

\renewcommand{\contentsname}{\normalfont\raggedright\Large\scshape{Contents}\vskip 0.4em\hrule height 0.8pt}

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

\newcommand{\regularsection}{
  \renewcommand{\thesection}{\arabic{section}}

  \titleformat{\section}
  {\normalfont}
  {\Large\scshape{{\defaultheader\ }\arabic{section}.}}
  {0.4em}
  {\Large\scshape}
  [{\titlerule[0.8pt]}]

  \titleformat{name=\section,numberless}
  {\normalfont}
  {\Large\scshape}
  {0em}
  {\Large\scshape}
  [{\titlerule[0.8pt]}]
}

\regularsection

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
  {\Large\scshape{Appendix \thesection. }}
  {0em}
  {\Large\scshape}
  [{\titlerule[0.8pt]}]
  \titleformat{name=\section,numberless}
  {\normalfont}
  {\Large\scshape{{Appendix}.\ }}
  {0em}
  {\Large\scshape}
  [{\titlerule[0.8pt]}]
}

\newcounter{thmcounter}[section]
\newcounter{thmcounternosection}

\renewcommand{\thethmcounter}{\thesection.\arabic{thmcounter}}
\renewcommand{\thethmcounternosection}{\arabic{thmcounternosection}}


% BEGIN ENVIRONMENTS

% END ENVIRONMENTS

% BEGIN CUSTOM_ENVIRONMENT

% END CUSTOM_ENVIRONMENT


\ifrosstex

  \setstretch{1.4}
  \setlength\parindent{0pt}

  \renewcommand{\titlekeyword}{Problem Set}
  \newcommand{\psetnum}[1]{\title{\titlekeyword\ \##1}}

  \let\subheadertitle\relax
  \let\subsubheadertitle\relax

  \fancypagestyle{rosstexstyle}{
    \fancyhf{}
    \renewcommand{\headrulewidth}{0pt}
    \fancyhead[LE,RO]{\scshape\small\thepage}
    \fancyhead[LO,RE]{\scshape\small\@date}
    \fancyhead[C]{\begin{tabular}{p{\headerlengthmiddle}}\centering\scshape\small {{\scshape\small\ifodd\value{page} {\scshape\small{{\thistitle}}}\else {\small\@altauthor}\fi}}\end{tabular}}

    \setlength{\headheight}{24.5042pt}
  }

  \pagestyle{rosstexstyle}

  \renewcommand{\defaultheader}{Problem}

  \renewcommand{\thesubsection}{\thesection\ (\alph{subsection})}
  \renewcommand{\thesubsubsection}{\thesubsection(\textit{\roman{subsubsection}})}

  \titlecontents{subsection}
  [3.5em]
  {}
  {\contentslabel{2.9em}}
  {\hspace*{-2.9em}}
  {\titlerule*[1pc]{.}\contentspage}

  \titlecontents{subsubsection}
  [5.25em]
  {}
  {\contentslabel{3.9em}}
  {\hspace*{-3.9em}}
  {\titlerule*[1pc]{.}\contentspage}

  \titleformat{\subsection}[runin]
  {\normalfont\bfseries}
  {\textbf{(\alph{subsection})}\ }
  {0em}
  {\bfseries}
  [.]

  \titleformat{\subsubsection}[runin]
  {\normalfont}
  {{(\textit{\roman{subsection}})}\ }
  {0em}
  {\itshape}
  [.]
\else
  \RequirePackage{indentfirst}
\fi

\endinput
