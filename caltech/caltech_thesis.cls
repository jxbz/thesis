\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{caltech/caltech_thesis}
              [2021/05/05 v0.4 Caltech thesis class]

% Load memoir
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions\relax
\LoadClass[oneside,12pt]{memoir}

\RequirePackage{etoolbox}

% Overleaf 28 Jan: Page geometry
\RequirePackage[letterpaper,top=1in,bottom=1in,left=1.5in,right=1.5in,headsep=\dimexpr 0.25in-1em,marginparwidth=1.25in]{geometry}

% Page number style
\makeoddhead{headings}{}{}{\sffamily\thepage}
\makeevenhead{headings}{}{}{\sffamily\thepage}
\makeoddfoot{plain}{}{}{}
\makeevenfoot{plain}{}{}{}

\RequirePackage{graphicx}

%% Overleaf 24 Jan: Formatting of ToC and lists
\let\listoffigurestables\listoffigures
\appto{\tableofcontents}{\clearpage}
\appto{\listoffigurestables}{\clearpage}
\appto{\listoffigures}{\clearpage}
\appto{\listoftables}{\clearpage}
\renewcommand{\contentsname}{Table of Contents}
\renewcommand{\listfigurename}{List of Figures \& Tables}
\renewcommand{\listtablename}{List of Tables}
\renewcommand{\cftdotsep}{5.0}

% \renewcommand{\listfigurename}{List of Illustrations and/or Tables}

\addtocontents{toc}{\protect\vskip 35pt}
\addtocontents{toc}{\protect\SingleSpacing}
\addtocontents{lof}{\protect\vskip 35pt}
%% In case single spacing is desired later
% \addtocontents{lof}{\protect\SingleSpacing}
% \addtocontents{lot}{\protect\SingleSpacing}
\addtocontents{lof}{{\protect\sffamily Number}\protect\hfill{\protect\sffamily Page}\protect\par}
\addtocontents{lot}{{\protect\itshape Number}\protect\hfill{\protect\itshape Page}\protect\par}

\setlength{\cftbeforechapterskip}{0pt}
\setcounter{tocdepth}{1}

% Captions
\RequirePackage{subcaption}
\DeclareCaptionFormat{custom}{{\sffamily #1#2} #3}
\captionsetup{format=custom}

%% For formatting chapter numbers as Roman but
%% not touch appendix alphabets
% \RequirePackage{xstring}
% \newcommand*{\IsInteger}[3]{%
%     \IfStrEq{#1}{ }{#3}{%
%         \IfInteger{#1}{#2}{#3}%
%     }%
% }%
% \newcommand{\formatchapternumber}[1]{%
%   \IsInteger{#1}{\uppercase\expandafter{\romannumeral #1\relax}}{#1}%
% }

\renewcommand{\chapternumberline}[1]{\chaptername\space#1:\space}
\patchcmd{\cftchapterleader}{\bfseries}{\normalfont}{}{}
\setlength{\cftpartnumwidth}{2em}
\renewcommand{\cftchapterpagefont}{\normalfont}
\renewcommand{\cftchapterdotsep}{\cftdotsep}
\setlength{\cftsectionnumwidth}{2em}

\renewcommand{\cftpartfont}{\large\bfseries\sffamily}
\renewcommand{\cftchapterfont}{\normalfont\sffamily}
\renewcommand{\cftsectionfont}{\sffamily}

\renewcommand{\cftpartpagefont}{\bfseries\sffamily}
\renewcommand{\cftchapterpagefont}{\sffamily}
\renewcommand{\cftsectionpagefont}{\sffamily}

% Merged list of figures and tables -- not needed
\def\table{\def\figurename{Table}\figure}
\let\endtable\endfigure

\setlength{\cftbeforefigureskip}{0pt}
\renewcommand{\cftfiguredotsep}{\cftdotsep}
\settowidth\cftfigurenumwidth{\itshape Number}
\renewcommand\cftfigurepresnum{\hfill}
\renewcommand\cftfigureaftersnum{\hskip1em}
\renewcommand{\cftfigurefont}{\sffamily}

\setlength{\cftbeforetableskip}{0pt}
\renewcommand{\cfttabledotsep}{\cftdotsep}
\settowidth\cfttablenumwidth{\itshape Number}
\renewcommand\cfttablepresnum{\hfill}
\renewcommand\cfttableaftersnum{\hskip1em}

\apptocmd{\appendix}{%
  \addtocontents{toc}{%
    \protect\renewcommand{\protect\chaptername}{Appendix}
  }%
}{}{}

% Overleaf, 22 January 2016: \subsection and onwards shouldn't be numbered
\setcounter{secnumdepth}{3}
\RequirePackage{letterspace} % not so heavy...

% Chapter headings
\renewcommand{\insertchapterspace}{}
\setlength{\midchapskip}{\onelineskip}
\setlength{\afterchapskip}{1.5\onelineskip}
\renewcommand{\chapternamenum}{\space\space}
\renewcommand{\chapterheadstart}{\clearforchapter}
\renewcommand{\chapnamefont}{\centering\sffamily}
\renewcommand{\chapnumfont}{\sffamily}
\renewcommand{\chaptitlefont}{\SingleSpacing\centering\normalfont\large\sffamily\bfseries}
\renewcommand{\printchaptertitle}[1]{\chaptitlefont\MakeUppercase{#1}}

% Part headings
\renewcommand{\partnamefont}{\normalfont\HUGE\sffamily\bfseries}
\renewcommand{\partnumfont}{\normalfont\HUGE\sffamily\bfseries}
\renewcommand{\parttitlefont}{\normalfont\HUGE\sffamily\bfseries\uppercase}

\renewcommand*{\beforepartskip}{\null\vskip 50pt}

\setlength{\fboxrule}{1pt}
\setlength{\fboxsep}{0pt}

\def\@partimage{}
\def\@partquote{}
\newcommand{\partimage}[1]{\gdef\@partimage{\fbox{\includegraphics[width=3in]{#1}}}}
\newcommand{\partquote}[2]{\gdef\@partquote{\justifying\normalsize\normalfont\textit{``#1''}

    \vspace{1ex}

    \hfill\RaggedLeft#2}}
\renewcommand{\printparttitle}[1]{\parttitlefont{ #1}\\[4ex]\@partimage\\[4ex]\@partquote\gdef\@partimage{}\gdef\@partquote{}}

% Add a command to create an extra chapter with TOC entry.
\newcommand{\extrachapter}[2][\@empty]{%
  \chapter*{#2}%
  \addcontentsline{toc}{chapter}{\ifx#1\@empty{#2}\else{#1}\fi}}

% Section headings
\setsecheadstyle{\normalfont\bfseries\sffamily}
\setbeforesecskip{\onelineskip}
\setaftersecskip{1pt}
\setsubsecheadstyle{\normalfont\bfseries\sffamily}
\setbeforesubsecskip{\onelineskip}
\setaftersubsecskip{1pt}

\aliaspagestyle{chapter}{headings}

%
% Define spacing for use on titlepage
%
\def\titleskip{\vskip 4\bigskipamount}      %% Whitespace after title
\def\authorskip{\vskip 2\bigskipamount}     %% Whitespace after author

%
% Additional titlepage definitions
%
\newcommand{\degreeaward}{\gdef\@degreeaward}
\degreeaward{Doctor of Philosophy}                  % Default is Ph.D.

\newcommand{\university}{\gdef\@university}
\university{California Institute of Technology}     % Default is Caltech

\newcommand{\unilogo}{\gdef\@unilogo}
\unilogo{caltech/caltech.png}                                  % Caltech logo

\newcommand{\address}{\gdef\@address}
\address{Pasadena, California}                      % Default is Caltech

\newcommand{\copyyear}{\gdef\@copyyear}
\newcommand{\defenddate}{\gdef\@defenddate}
% Overleaf: Updated 21 January 2016; don't put in a default year value
\copyyear{!!!!}
\defenddate{!!!!}

%
% Overleaf: added 21 January 2016
\newcommand{\orcid}[1]{\gdef\@orcid{#1}}
\orcid{xxxxx}
\newcommand{\rightsstatement}[1]{\gdef\@rightsstatement{#1}}
\rightsstatement{All rights reserved}
\newcommand{\website}[1]{\gdef\@website{#1}}
\website{xxx}

% The copyright page is new, must conform to CIT requirements
%
\newcommand{\makecopyright}{%
 {\sffamily \parindent=0pt
 \null              % Forces rest to bottom of page
 \vfill
 \begin{center}
   \SingleSpacing
   \copyright~\@copyyear\par
   \@author\\ORCID: \@orcid\\\url{\@website
   }\par
   \@rightsstatement\par
 \end{center}}
 \newpage
}               %% End of \makecopyright

\renewcommand{\maketitle}[1][]{%
 \begin{titlingpage}
   \sffamily
   \OnehalfSpacing
   \let\footnotesize\small \let\footnoterule\relax \setcounter{page}{1}
   \vskip-\headsep
   \begin{center}
     {\SingleSpacing\Large\bfseries\@title\par}
     \titleskip
     Thesis by\\
     {\large \@author}\par
     \authorskip
     In Partial Fulfillment of the Requirements for\\the Degree of
     \@degreeaward\par
     \ifstrequal{#1}{logo}{
       \vspace{\stretch{8}}
       \includegraphics[width=1.8in]{\@unilogo} \\
       \vspace{\stretch{2}}
     }{\vfill}
      \@university\\
     \@address\par
     \authorskip
     \@copyyear\\
     {\normalsize Defended \@defenddate\par}
   \end{center}
   \vspace*{.5in}
 \end{titlingpage}
 \pagenumbering{roman}
 \setcounter{page}{2}
 \makecopyright
}               %% End of \maketitle


% The abstract and acknowledgments are treated as unnumbered chapters
% with Table of Contents entries.
\renewenvironment{abstract}
  {\extrachapter{Abstract}}
  {\clearpage}
\newenvironment{acknowledgments}
  {\extrachapter{Acknowledgments}}
  {\clearpage}
% although `acknowledgments' is preferred
\newenvironment{acknowledgements}
  {\extrachapter{Acknowledgements}}
  {\clearpage}

% Overleaf: 22 January 2016 -- non-zero paragraph skip
\nonzeroparskip
\setlength{\parindent}{0pt}
\OnehalfSpacing

\nobibintoc

%%% 1 Mar 2017: Need to accommodate bibtex AND biblatex
\AtBeginDocument{%
  \@ifpackageloaded{biblatex}
  {%\usepackage[backend=biber,natbib,style=authoryear]{biblatex}
  \DeclareFieldFormat{addendum}{}
  \AtBeginBibliography{\SingleSpacing}
  \setlength{\bibitemsep}{\parskip}
  \defbibheading{publishedcontent}{\extrachapter{Published Content and Contributions}}
  \defbibnote{pcinstructions}{[Include a bibliography of published articles or other material that are included as part of the thesis.  Describe your role with the each article and its contents.  Citations must include DOIs or publisher URLs if available electronically.

If you are incorporating any third-party material in the thesis, including works that you have authored/co-authored but for which you have transferred copyright, you must indicate that permission has been secured to use the material. For example: ``Fig.~2 reprinted with permission from the copyright holder, {holder name}''

Add the option \texttt{iknowwhattodo} to this environment to dismiss this message.]}

  \newenvironment{publishedcontent}[1][]{
    \newtoggle{printinstr}
    \ifstrequal{#1}{iknowwhattodo}
         {\togglefalse{printinstr}}
         {\toggletrue{printinstr}}
    \DeclareFieldFormat{addendum}{\\##1}
    \begin{refsection}
    %% Nov 18, 2016: list in reverse chronological order
    \begin{refcontext}[sorting=ydnt]{}
  }{
     \iftoggle{printinstr}{
\printbibliography[heading=publishedcontent,prenote=pcinstructions]
     }{
\printbibliography[heading=publishedcontent]
     }
     \end{refcontext}
     \end{refsection}
     \citereset
  }

  \newcommand{\publishedas}[1]{
    \begin{refsection}
    \nocite{#1}
    \printbibliography[heading=none]
    \end{refsection}
    \citereset
  }
}{%%%%% so if not using biblatex
  \@ifpackageloaded{natbib}{}{\PackageError{caltech-thesis}{Using bibtex without natbib! PLEASE load natbib, or even better, use biblatex (and the relevant template for that!}{}}
%   \apptocmd{\thebibliography}{\phantomsection\addcontentsline{toc}{chapter}{\bibname}}{}{}
  
  \@ifpackageloaded{bibunits}{
    \newenvironment{publishedcontent}[1][]{%
      \ifstrequal{#1}{iknowwhattodo}{}
        {\renewcommand{\bibpreamble}{
          Include a bibliography of published articles or other material that are included as part of the thesis.  Describe your role with the each article and its contents.  Citations must include DOIs or publisher URLs if available electronically.\par
If you are incorporating any third-party material in the thesis, including works that you have authored/co-authored but for which you have transferred copyright, you must indicate that permission has been secured to use the material. For example: ``Fig.~2 reprinted with permission from the copyright holder, {holder name}''\par
Add the option \texttt{iknowwhattodo} to this environment to dismiss this message.\par}}

      \renewcommand{\bibsection}{}%
      \ifdef{\stdthebibliography}{%
        \patchcmd{\stdthebibliography}{\addcontentsline{toc}{chapter}{\bibname}}{}{}{}%
      }{
        \patchcmd{\thebibliography}{\addcontentsline{toc}{chapter}{\bibname}}{}{}{}%
      }%
      \begin{bibunit}
    }{\end{bibunit}}}
  { %% no bibunit; raise warning
    \PackageWarning{caltech_thesis}{Sorry, publishedcontent is only available with biblatex! Please format the list manually instead.}
    \textbf{Sorry, publishedcontent is only available  with biblatex! Please format the list manually instead.}\par
  }
  
  
  \@ifpackageloaded{bibunits}{
     \newcommand{\publishedas}[2]{%
        \begin{bibunit}%
        \renewcommand{\bibsection}{}%
        \renewcommand{\bibnumfmt}[1]{}%
        \ifdef{\stdthebibliography}{%
          \patchcmd{\stdthebibliography}{\addcontentsline{toc}{chapter}{\bibname}}{}{}{}%
        }{
          \patchcmd{\thebibliography}{\addcontentsline{toc}{chapter}{\bibname}}{}{}{}%
        }
        \nocite{#2}\putbib[#1]
        \end{bibunit}%
     }
  }{%
    \newcommand{\publishedas}[1]{%
      \PackageWarning{caltech_thesis}{Sorry, \textbackslash publishedas is only available with biblatex or bibtex+bibunits! Please format the "published as" statement manually instead.}
      \textbf{Sorry, \textbackslash publishedas is only available  with biblatex or bibtex+bibunits! Please format the ``published as'' statement manually instead.}\par}
  }

  \setlength{\bibitemsep}{\parskip}
  \renewcommand{\bibfont}{\SingleSpacing}
  
  }% END if not using biblatex

} %% END AtBeginDocument

% Overleaf: 25 January 2016 -- for nomenclature
\RequirePackage[intoc]{nomencl}
\makenomenclature
\renewcommand{\nompreamble}{\SingleSpacing\itemindent 0pt}
\renewcommand{\nomlabel}[1]{\bfseries #1.}
\renewcommand{\nomentryend}{.}

% Overleaf: 25 January 2016 -- for index
\RequirePackage{imakeidx}
\makeindex[columns=1,options=-s simple_letters]

% Overleaf: 25 January 2016 -- for endnotes
\RequirePackage{endnotes}
\renewcommand{\notesname}{}
\pretocmd{\theendnotes}{\clearpage}{}{}

% Overleaf: 28 January 2016 -- no more pagenumbers in the TOC
\newcommand{\pocketmaterial}{\addtocontents{toc}{\cftpagenumbersoff{chapter}}}

\endinput
