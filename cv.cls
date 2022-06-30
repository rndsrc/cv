% Begin `cv.cls' --- alpha version
%
% A Simple Curriculum Vitae Document Class
%
% Written by Chi-kwan Chan (Fall 2011)
%
%==============================================================================
% Identification
%------------------------------------------------------------------------------
\NeedsTeXFormat{LaTeX2e}[1995/12/01]

\ProvidesClass{cv}[%
  2011/09/29%
  Steward Observatory, the University of Arizona%
  A Simple Curriculum Vitae Document Class%
]

%==============================================================================
% Initialize and declare options
%-----------------------------------------------------------------------------
\newif\if@resume\@resumefalse

\DeclareOption{resume}\@resumetrue
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

\ProcessOptions

%==============================================================================
% Package loading
%------------------------------------------------------------------------------
\LoadClass{article}

\RequirePackage{multicol,multirow,rotating}
\RequirePackage{hyperref}
\RequirePackage{graphicx,eso-pic}

%==============================================================================
% Layout/Format
%------------------------------------------------------------------------------
% Page layout:
% 1 inch = 72 pt
\setlength{\hoffset       }{  0pt}
\setlength{\voffset       }{  0pt}
\setlength{\oddsidemargin }{  0pt}
\setlength{\evensidemargin}{  0pt} % most people don't understand LaTeX!
\setlength{\topmargin     }{  4pt}
\setlength{\headheight    }{ 12pt}
\setlength{\headsep       }{ 20pt} % at least 0.25 inch = 18 pt so we are good
\setlength{\textheight    }{612pt} % = 8.5 inches, giving 1 inch bottom margin
\setlength{\textwidth     }{468pt} % = 6.5 inches, giving 1 inch right margin
\setlength{\marginparsep  }{  4pt}
\setlength{\marginparwidth}{ 32pt}
\setlength{\footskip      }{ 36pt}

%------------------------------------------------------------------------------
% Spacing:
\newcommand\cv@parsep{1.ex}
\newcommand\cv@subsep{.5ex}
\newcommand\cv@tlssep{.5ex}
\newcommand\cv@ilssep{.5ex}

%------------------------------------------------------------------------------
% Page style:
\if@resume
  \title{R\'esum\'e}
\else
  \title{Curriculum Vitae}
\fi
\markboth{\@title}{\@title}
\title{}

\newcommand\cv@srule{\hspace{-\textwidth}\rule[-1.ex]{\textwidth}{0.4pt}}
\newcommand\cv@frule{\hspace{-\textwidth}\rule[-.8ex]{\textwidth}{1.2pt}%
                     \hspace{-\textwidth}\rule[-1.ex]{\textwidth}{0.4pt}}

\newcommand{\ps@fancy}{
  \let\@mkboth\@gobbletwo
  \def\@oddhead {\reset@font\LARGE\textsc\@title\hfil\textsc\@author\cv@frule}
  \def\@evenhead{\reset@font\LARGE\textsc\@author\hfil\textsc\@title\cv@frule}
}
\renewcommand{\ps@plain}{
  \let\@mkboth\@gobbletwo
  \def\@oddhead {\reset@font\textsc\rightmark\hfil\textsc\@author\cv@srule}
  \def\@evenhead{\reset@font\textsc\@author\hfil\textsc\leftmark \cv@srule}
}
\pagestyle{plain}

%------------------------------------------------------------------------------
% Redefine paragraphs:
\renewcommand\section{\@startsection{section}{1}{\z@}%
  {-3.5ex \@plus -1ex \@minus -.5ex}%
  {2.3ex \@plus .2ex}%
  {\normalfont\large\bfseries}}

\renewcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
  {\cv@parsep}{-1em}{\normalfont\normalsize\bfseries}}
\renewcommand\subparagraph{\@startsection{subparagraph}{5}{\z@}%
  {\cv@subsep}{-1em}{\normalfont\normalsize\bfseries}}

%------------------------------------------------------------------------------
% Itemize list
\newenvironment{blist}{\itemize
                \parskip\z@\topsep\z@\partopsep\z@
                \itemsep\cv@tlssep\itemindent\z@
                \parsep\z@\listparindent\z@
                \labelsep\z@
                \labelwidth18pt
                \leftmargin18pt
                \rightmargin\z@
                \let\makelabel\tlistlabel}
               {\enditemize}

% Tabbed list
\newenvironment{tlist}{\list{}
               {\parskip\z@\topsep\z@\partopsep\z@
                \itemsep\cv@tlssep\itemindent\z@
                \parsep\z@\listparindent\z@
                \labelsep\z@
                \labelwidth1in
                \leftmargin1in
                \rightmargin\z@
                \let\makelabel\tlistlabel}}
               {\endlist}
\newcommand*\tlistlabel[1]{\normalfont #1\hfill}

% Wide tabbed list
\newenvironment{Tlist}{\list{}
               {\parskip\z@\topsep\z@\partopsep\z@
                \itemsep\cv@tlssep\itemindent\z@
                \parsep\z@\listparindent\z@
                \labelsep\z@
                \labelwidth1.25in
                \leftmargin1.25in
                \rightmargin\z@
                \let\makelabel\Tlistlabel}}
               {\endlist}
\newcommand*\Tlistlabel[1]{\normalfont #1\hfill}

% Inverse enumerate list
\RequirePackage[parskip=0pt,topsep=0pt,partopsep=0pt,
                itemsep=\cv@ilssep,itemindent=0pt,
                parsep=0pt,listparindent=0pt,
                labelsep=.5em,
                labelwidth=2.em,
                leftmargin=2.em,
                rightmargin=0pt]{etaremune}
\newenvironment{ilist}{\etaremune{}{}}{\endetaremune}

%------------------------------------------------------------------------------
% References
\usepackage[square,comma,super]{natbib}
\bibliographystyle{unsrtapj}
\renewcommand\bibfont{\scriptsize}%{\footnotesize}
\setlength\bibsep{\z@}
\renewcommand\bibpreamble{\begin{multicols}{2}}
\renewcommand\bibpostamble{\end{multicols}}
\renewcommand\bibsection{\subsection*{%
    \refname\@mkboth{\MakeUppercase{\refname}}{\MakeUppercase{\refname}}}}

%==============================================================================
% Main code
%------------------------------------------------------------------------------
% Title page information:
\newcommand\address  [1]{\gdef\cv@address  {#1}}
\newcommand\info     [1]{\gdef\cv@info     {#1}}
\newcommand\phone    [1]{\gdef\cv@phone    {#1}}
\newcommand\email    [1]{\gdef\cv@email    {#1}}
\newcommand\website  [1]{\gdef\cv@website  {#1}}
\newcommand\repos    [1]{\gdef\cv@repos    {#1}}
\newcommand\github   [1]{\gdef\cv@github   {#1}}
\newcommand\gitlab   [1]{\gdef\cv@gitlab   {#1}}
\newcommand\bitbucket[1]{\gdef\cv@bitbucket{#1}}

% Cover letter
\newcommand\background[1]{\gdef\cl@background{#1}}
\newcommand\sender    [1]{\gdef\cl@address   {#1}}
\newcommand\recipient [1]{\gdef\cl@recipient {#1}}
\newcommand\greetto   [1]{\gdef\cl@greetto   {#1}}
\newcommand\closing   [1]{\gdef\cl@closing   {#1}}

\background{}
\sender{}

%------------------------------------------------------------------------------
% E-mail
\newcommand\mailto[1]{\href{mailto:#1}{\texttt{#1}}}

% Redefine \part[]{}
\def\@part[#1]#2{%
  \thispagestyle{fancy}
  \ifnum \c@secnumdepth >\m@ne
    \refstepcounter{part}%
    \addcontentsline{toc}{part}{\thepart\hspace{1em}#2}%
  \else
    \addcontentsline{toc}{part}{#2}%
  \fi
  \title{#1}
  \markboth{#2}{#2}
  \@afterheading}

% Redefine \part*{}, which takes only one argument
\def\@spart#1{\markboth{#1}{#1}\@afterheading}

%------------------------------------------------------------------------------
% Set Page Title
\newcommand\pagetitle[1]{\markboth{#1}{#1}}

%------------------------------------------------------------------------------
% Make cover letter
\newcommand\makecover[1]{
  \thispagestyle{empty}
  \vspace*{-36pt} % - \topmargin - \headheight - \headsep
  {
    \setlength\parindent{0pt}
    \setlength\parskip{0.7em}
    {\raggedleft\begin{tabular}{l@{}}
      \ignorespaces%
      \ifx\@empty\cl@address\cv@address\else\cl@address\fi\\*[\parskip]
      \@date
      \end{tabular}\par}
    \cl@recipient\par\vspace{\parskip}
    \cl@greetto\par
    \input{#1}\strut\par\nobreak\vspace{\parskip}
    \noindent\hspace*{.67\textwidth}
    \parbox{.33\textwidth}{\strut\raggedright
      \cl@closing\\*[2\medskipamount]
      \includegraphics[scale=0.125]{signature}\\
      \@author}
  }
  \ifx\@empty\cl@background\else % add background
    \AddToShipoutPicture*{\put(0,0){\parbox[b][\paperheight]{\paperwidth}{%
      \vfill\centering%
      \includegraphics[width=\paperwidth,height=\paperheight,%
        keepaspectratio]{\cl@background}%
    }}}%
  \fi
}

%------------------------------------------------------------------------------
% Make resume
\let\maketitle\undefined % don't need maketitle
\newcommand\makeinfo{
  \thispagestyle{fancy}
  {
    \parindent\z@
    \begin{minipage}[t]{0.50\textwidth}\raggedright
      \cv@address%
      \ifcsname cv@info\endcsname\\\cv@info\fi
    \end{minipage}
    \begin{minipage}[t]{0.50\textwidth}\raggedleft
      Phone:~\cv@phone\\
      E-mail:~\mailto{\cv@email}\\
      Website:~\url{\cv@website}%
      \ifcsname cv@repos\endcsname\\\url{\cv@repos}\fi
      \ifcsname cv@github\endcsname\\\url{\cv@github}\fi
      \ifcsname cv@gitlab\endcsname\\\url{\cv@gitlab}\fi
      \ifcsname cv@bitbucket\endcsname\\\url{\cv@bitbucket}\fi
    \end{minipage}
  }
  \vspace*{-3.5pt}
}

%==============================================================================
% End `cv.cls'
