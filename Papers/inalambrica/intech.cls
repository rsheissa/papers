%%% -----------------------------------------------------------------------------
% LaTeX class for the IN-TECH Web book class 
% 
% created by: Zlatko Lekic, 2011, lekic@intechweb.org
%	
% -----------------------------------------------------------------------------
%%
%% This file is 'intech.cls'
%% 
%% 
%% 

%%% identification
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{intech}[2009/12/15 v. 1.10 IN-TECH Web book class]

\ProcessOptions \relax
\typeout{***************************************************************************************************}
\typeout{* If you need help with LaTeX and if you want to report bugs, please contact: lekic@intechweb.org *}
\typeout{********  For publishing assistance contact your corresponding Publishing Process Manager  ********}
\typeout{***************************************************************************************************}
%%% package loading
\LoadClass[twoside]{article}

%%% main code
\RequirePackage{ifthen}
\RequirePackage[papersize={17cm,24cm},top={2,5cm},bottom={3cm},hmargin={2cm},nohead,nofoot,dvips,pdftex]{geometry}
\RequirePackage{amsfonts,amstext,amssymb,amsmath,amsthm,amscd,bm,paralist,color}
\RequirePackage{graphicx,array}
\RequirePackage{epstopdf}
\RequirePackage{mathpazo}
\RequirePackage[scaled=.95]{helvet}
\RequirePackage{courier}
\RequirePackage[T1]{fontenc}
\RequirePackage{textcomp}
\RequirePackage[sort&compress]{natbib}
\RequirePackage[english]{babel}
\RequirePackage[singlelinecheck=false,figurename=Fig.,labelsep=period,skip=9pt,small]{caption}
\RequirePackage{subfigure}
\RequirePackage[bottom]{footmisc}
\RequirePackage{float,verbatim}
\RequirePackage{fancyhdr}
\RequirePackage{calc}
\RequirePackage{titlesec}




\setlength{\parskip}{9pt plus 0.5ex minus 0.2ex}

\def\chaptername{Chapter}

\RequirePackage[breaklinks,hyperfootnotes=false]{hyperref}

\newboolean{@booktitle}
\newboolean{@secondauthors}
\newboolean{@secondaffiliation}
\newboolean{@secondcountry}
\newboolean{@thirdauthors}
\newboolean{@thirdaffiliation}
\newboolean{@thirdcountry}


\pagestyle{fancy} 

% \lhead[{\huge\thepage}}]{\@chaptertitle}%	
% \rhead[\ifthenelse{\boolean{@booktitle}}{\@booktitle}{Book Title}]{\thepage}%

  \fancyhf{} %delete the current section for header and footer 
  \fancyhead[LE,RO]{\tiny\fontfamily{fvs}\selectfont\thepage} 
  \fancyhead[LO]{\tiny\fontfamily{fvs}\selectfont\@booktitle} 
  \fancyhead[RE]{\tiny\fontfamily{fvs}\selectfont\@chaptertitle}
\renewcommand{\headrulewidth}{.5pt}%

\cfoot{}

\fancypagestyle{plain}{%
  \fancyhf{}%
  \renewcommand{\headrulewidth}{.0pt}%
  \renewcommand{\footrulewidth}{0pt}%
\setlength{\headsep}{0pt}
}

\setlength{\voffset}{-30pt}
\setlength{\headsep}{30pt}

\raggedbottom
\addtolength{\topskip}{0pt plus 0pt}
\setlength{\parindent}{0ex}

\widowpenalty=9999
\clubpenalty=9999

\newlength{\myFootnoteWidth}
\newlength{\myFootnoteLabel}
\setlength{\myFootnoteLabel}{0.8em}%  <-- can be changed to any valid value
\renewcommand{\@makefntext}[1]{%
  \setlength{\myFootnoteWidth}{\columnwidth}%
  \addtolength{\myFootnoteWidth}{-\myFootnoteLabel}%
  \noindent\makebox[\myFootnoteLabel][r]{\@makefnmark\ }%
  \parbox[t]{\myFootnoteWidth}{#1}%
}

\newcommand{\booktitle}[1]{\gdef\@booktitle{#1}\setboolean{@booktitle}{true}}

\newcommand{\chaptertitle}[1]{\gdef\@chaptertitle{#1}}
\newcommand{\@chaptertitle}{\@latex@error{No \noexpand\chaptertitle given}\@ehc}

\newcommand{\authors}[1]{\gdef\@authors{#1}}
\newcommand{\@authors}{\@latex@error{No \noexpand\authors given}\@ehc}

\newcommand{\affiliation}[1]{\gdef\@affiliation{#1}}
\newcommand{\@affiliation}{\@latex@error{No \noexpand\affiliation given}\@ehc}

\newcommand{\country}[1]{\gdef\@country{#1}}
\newcommand{\@country}{\@latex@error{No \noexpand\country given}\@ehc}

\newcommand{\secondauthors}[1]{\gdef\@secondauthors{#1}\setboolean{@secondauthors}{true}}
\newcommand{\secondaffiliation}[1]{\gdef\@secondaffiliation{#1}\setboolean{@secondaffiliation}{true}}
\newcommand{\secondcountry}[1]{\gdef\@secondcountry{#1}\setboolean{@secondcountry}{true}}

\newcommand{\thirdauthors}[1]{\gdef\@thirdauthors{#1}\setboolean{@thirdauthors}{true}}
\newcommand{\thirdaffiliation}[1]{\gdef\@thirdaffiliation{#1}\setboolean{@thirdaffiliation}{true}}
\newcommand{\thirdcountry}[1]{\gdef\@thirdcountry{#1}\setboolean{@thirdcountry}{true}}

\newcounter{chapter}
\setcounter{chapter}{1}

\def\@sect#1#2#3#4#5#6[#7]#8{%
  \ifnum #2>\c@secnumdepth
    \let\@svsec\@empty
  \else
    \refstepcounter{#1}%
    \protected@edef\@svsec{\csname the#1\endcsname
\ifnum #2<1.\fi}%
  \fi
  \@tempskipa #5\relax
  \ifdim \@tempskipa>\z@
    \begingroup
      #6{%
        \@hangfrom{\hskip #3\relax\@svsec\hspace{1ex}}%
          \interlinepenalty \@M #8 \@@par}%
    \endgroup
    \csname #1mark\endcsname{#7}%
    \addcontentsline{toc}{#1}{%
      \ifnum #2>\c@secnumdepth \else
        \protect\numberline{\csname the#1\endcsname}%
      \fi
      #7}%
  \else
    \def\@svsechd{%
      #6{\hskip #3\relax
      \@svsec #8}%
      \csname #1mark\endcsname{#7}%
      \addcontentsline{toc}{#1}{%
        \ifnum #2>\c@secnumdepth \else
          \protect\numberline{\csname the#1\endcsname}%
        \fi
        #7}}%
  \fi
  \@xsect{#5}}

%% Define \normalsize as 9 pt which is normally \small 

\renewcommand\normalsize{%
   \@setfontsize\normalsize\@ixpt{11}%
   \abovedisplayskip 8.5\p@ \@plus3\p@ \@minus4\p@
   \abovedisplayshortskip \z@ \@plus2\p@
   \belowdisplayshortskip 4\p@ \@plus2\p@ \@minus2\p@
   \def\@listi{\leftmargin\leftmargini
               \topsep 4\p@ \@plus2\p@ \@minus2\p@
               \parsep 2\p@ \@plus\p@ \@minus\p@
               \itemsep \parsep}%
   \belowdisplayskip \abovedisplayskip
}
\renewcommand \small{%
   \@setfontsize \small\@viiipt{9.5}%
   \abovedisplayskip 6\p@ \@plus2\p@ \@minus4\p@
   \abovedisplayshortskip \z@ \@plus\p@
   \belowdisplayshortskip 3\p@ \@plus\p@ \@minus2\p@
   \def\@listi{\leftmargin\leftmargini
               \topsep 3\p@ \@plus\p@ \@minus\p@
               \parsep 2\p@ \@plus\p@ \@minus\p@
               \itemsep \parsep}%
   \belowdisplayskip \abovedisplayskip
}

\renewcommand\scriptsize{\@setfontsize\scriptsize\@viiipt\@ixpt}
\newcommand\fauthors{\@setfontsize\tiny{8}{10.6}}
\renewcommand\footnotesize{\@setfontsize\footnotesize{7 }{10}}
\renewcommand\tiny{\@setfontsize\tiny\@vpt\@vipt}
\renewcommand\large{\@setfontsize\large{13}{16.6}}
\renewcommand\Large{\@setfontsize\Large\@xipt{13.6}}
\renewcommand\LARGE{\@setfontsize\LARGE{16}{20.6}}%{16}{20.6}}
\renewcommand\huge{\@setfontsize\huge{18}{23}}
\renewcommand\Huge{\@setfontsize\Huge\@xxvpt{30}}
%\let\footnotesize=atiny

\setcounter{secnumdepth}{5}%
\setcounter{tocdepth}{5}%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Novo definisanje naslova sekcija i drugih , format i spacng
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\titleformat{\section}[hang]{\bfseries\Large\raggedright}{\thesection.}{.2em}{\bfseries\Large}[\rm]
\titleformat{\subsection}[hang]{\bfseries\normalsize\raggedright}{\thesubsection}{.2em}{\bfseries\normalsize}[\rm]
\titleformat{\subsubsection}[hang]{\itshape\normalsize\raggedright}{\thesubsubsection}{.2em}{\itshape\normalsize}[\rm]
\titleformat{\paragraph}[hang]{\normalfont\normalsize\raggedright}{\theparagraph}{.2em}{\normalfont\normalsize}[\rm]
\titleformat{\subparagraph}[hang]{\normalfont\normalsize\slshape\raggedright}{\thesubparagraph}{.2em}{\normalfont\normalsize\slshape}[\rm]


%\titlespacing{\section}{0pt}{9pt plus 2pt minus 1pt}{9pt plus 2pt minus 1pt}
%\titlespacing{\subsection}{0pt}{9pt plus 2pt minus 1pt}{9pt plus 2pt minus 1pt}
%\titlespacing{\subsubsection}{0pt}{9pt plus 2pt minus 1pt}{9pt plus 2pt minus 1pt}
%\titlespacing{\paragraph}{0pt}{9pt plus 2pt minus 1pt}{9pt plus 2pt minus 1pt}
%\titlespacing{\subparagraph}{0pt}{9pt plus 2pt minus 1pt}{9pt plus 2pt minus 1pt}

\titlespacing{\section}{0pt}{1pt }{1pt }
\titlespacing{\subsection}{0pt}{1pt }{1pt }
\titlespacing{\subsubsection}{0pt}{1pt }{1pt }
\titlespacing{\paragraph}{0pt}{1pt }{1pt }
\titlespacing{\subparagraph}{0pt}{1pt }{1pt }

  
\def\@maketitle{\newpage
\begin{flushright}
{\vspace*{1pt}\Large\fontfamily{fvs}\selectfont {Chapter }{}\arabic{chapter}}\\%
        \rule{\textwidth}{.5pt}
        \end{flushright}
\begin{flushleft}
        \begin{spacing}{1.8}
  {  \vspace*{-9pt} \LARGE\fontfamily{fvs}\selectfont\@chaptertitle}\\  %
          \end{spacing}\vspace*{-5pt}
          {\rule{3cm}{.5pt}}\\*[7pt]
      {\fontfamily{fvs}\Large \@authors\par}\vspace*{7pt}%   
 {\fontfamily{fvs}\fauthors  \@affiliation\par} %\vspace*{7pt}  
 {\fontfamily{fvs}\fauthors \@country}\par%
  \ifthenelse{\boolean{@secondauthors}}{\vskip\baselineskip%
 {\Large\fontfamily{fvs}\Large \@secondauthors\par}%   
 {\large\fontfamily{fvs} \fauthors \@secondaffiliation\par}%  
 {\large\fontfamily{fvs}\fauthors \@secondcountry\par}%
    }{}%
  \ifthenelse{\boolean{@thirdauthors}}{\vskip\baselineskip%
 {\Large\fontfamily{fvs}\Large \@thirdauthors\par}  
 {\large\fontfamily{fvs}\fauthors  \@thirdaffiliation\par}  
 {\large\fontfamily{fvs}\fauthors \@thirdcountry\par}%
    }{}%
 {\vspace*{-8pt}\rule{3cm}{.5pt}}\\    
    \vspace{5pt}
    \end{flushleft}
}%

%%% Set special bibliography and citation style
\renewcommand{\bibsection}{\section{References}}
\setlength{\bibhang}{1.24cm}
\setlength{\parindent}{3cm}
\setlength{\bibsep}{0cm}
\bibliographystyle{dcu}
\setcitestyle{authoryear,round,citesep={;},aysep={,},yysep={;}}
\gdef\harvardand{\&}



%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%NOVE STVARI



%%%%%%%%
%Novi paket
\usepackage{soul}% razmak izmedju slova
\usepackage{setspace}% razmak izmedju linija redova
%%%%%%%%%%%%%%%%%%%%%%%
%\sodef\razmakslova{\normalfont}{-.1em}{1em }{1em}
%%%%%%%%%%%%%%%%%%%%%


%float objekti i prostor oko njih
\setlength\parindent{15em}
\setcounter{topnumber}{8}
\renewcommand\topfraction{1}
\setcounter{bottomnumber}{3}
\renewcommand\bottomfraction{.99}
\setcounter{totalnumber}{8}
\renewcommand\textfraction{0.01}
\renewcommand\floatpagefraction{.8}
\setcounter{dbltopnumber}{6}
\renewcommand\dbltopfraction{1}
\renewcommand\dblfloatpagefraction{.8}

\setlength\floatsep        {6\p@ \@plus 2\p@ \@minus 2\p@}
\setlength\textfloatsep   {6\p@ \@plus 2\p@ \@minus 2\p@}
\setlength\intextsep      {6\p@ \@plus 2\p@ \@minus 2\p@}
\setlength\dblfloatsep    {6\p@ \@plus 2\p@ \@minus 2\p@}
\setlength\dbltextfloatsep{6\p@ \@plus 2\p@ \@minus 2\p@}

%vrednosti iz pj.cls
%\setlength\floatsep        {12\p@ \@plus 2\p@ \@minus 2\p@}
%\setlength\textfloatsep   {20\p@ \@plus 2\p@ \@minus 4\p@}
%\setlength\intextsep      {12\p@ \@plus 2\p@ \@minus 2\p@}
%\setlength\dblfloatsep    {12\p@ \@plus 2\p@ \@minus 2\p@}
%\setlength\dbltextfloatsep{20\p@ \@plus 2\p@ \@minus 4\p@}

\usepackage[none]{hyphenat}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%ovo je uvlacenje prvog reda i vazi saamo za itemize
\setlength{\parindent}{13pt}

% fixed indentation for standard itemize-environment
\newdimen\svitemindent \setlength{\svitemindent}{\parindent}


% make indentations changeable

\def\setitemindent#1{\settowidth{\labelwidth}{#1}%
        \let\setit@m=Y%
        \leftmargini\labelwidth
        \advance\leftmargini\labelsep
   \def\@listi{\leftmargin\leftmargini
        \labelwidth\leftmargini\advance\labelwidth by -\labelsep
        \parsep=\parskip
        \topsep=\medskipamount
        \itemsep=\parskip \advance\itemsep by -\parsep}}
\def\setitemitemindent#1{\settowidth{\labelwidth}{#1}%
        \let\setit@m=Y%
        \leftmarginii\labelwidth
        \advance\leftmarginii\labelsep
\def\@listii{\leftmargin\leftmarginii
        \labelwidth\leftmarginii\advance\labelwidth by -\labelsep
        \parsep=\parskip
        \topsep=\z@
        \itemsep=\parskip \advance\itemsep by -\parsep}}
%

%
\def\itemize{%
  \ifnum \@itemdepth >\thr@@\@toodeep\else
    \advance\@itemdepth\@ne
    \ifx\setit@m\undefined
       \ifnum \@itemdepth=1 \leftmargini=\svitemindent
          \labelwidth\leftmargini\advance\labelwidth-\labelsep
          \leftmarginii=\leftmargini \leftmarginiii=\leftmargini
       \fi
    \fi
    \edef\@itemitem{labelitem\romannumeral\the\@itemdepth}%
    \expandafter\list
      \csname\@itemitem\endcsname
      {\def\makelabel##1{\rlap{##1}\hss}}%
  \fi}

%

\let\ts\,

\setlength \labelsep     {5\p@}
\setlength\leftmargini   {13\p@}
\setlength\leftmargin    {\leftmargini}
\setlength\leftmarginii  {\leftmargini}
\setlength\leftmarginiii {\leftmargini}
\setlength\leftmarginiv  {\leftmargini}
\setlength\labelwidth    {\leftmargini}
\addtolength\labelwidth{-\labelsep}

\def\@listI{\leftmargin\leftmargini
        \parsep=\parskip
        \topsep=\medskipamount
        \itemsep=\parskip \advance\itemsep by -\parsep}
\let\@listi\@listI
\@listi

\def\@listii{\leftmargin\leftmarginii
        \labelwidth\leftmarginii
        \advance\labelwidth by -\labelsep
        \parsep=\parskip
        \topsep=\z@
        \itemsep=\parskip
        \advance\itemsep by -\parsep}

\def\@listiii{\leftmargin\leftmarginiii
        \labelwidth\leftmarginiii\advance\labelwidth by -\labelsep
        \parsep=\parskip
        \topsep=\z@
        \itemsep=\parskip
        \advance\itemsep by -\parsep
        \partopsep=\topsep}
        
\setlength\arraycolsep{1.5\p@}
\setlength\tabcolsep{1.5\p@}        

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Definisanje da NE BUDE UVLACENJA PRVOG REDA U PARAGRAFU
%%%%%%%%%%%%%%%%%%%
\setlength{\parindent}{0pt}
\sloppypar % da izravna desnu stranu redova, dobra komanda

%Fusnote

%\setlength\footnotesep{27.7\p@}%udaljenje crte od teksta fusnote

\renewcommand\footnoterule{%
  \kern-3\p@
  \hrule\@width 50\p@
  \kern2.6\p@}

\newdimen\foot@parindent
\foot@parindent 10.83\p@


