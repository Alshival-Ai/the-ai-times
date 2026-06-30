% AUTHOR: Nicklas Vraa
% Documentation: https://github.com/NicklasVraa/LiX
% ------------------------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{news}[2023/02/10 For newspapers]

% Intercept class options.
\newcommand{\numColumns}{1}
\DeclareOption{twocolumn}{
    \renewcommand{\numColumns}{2}
    \PassOptionsToClass{\CurrentOption}{extbook}
}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{extbook}}
\ProcessOptions\relax
\LoadClass[14pt]{extbook}

% SETUP: -----------------------------------------------------------------------
\RequirePackage[basics, figures, formatting, header, headings, metadata, periodical, publish, size]{lix}
\RequirePackage{setspace, silence, times, titlesec, titletoc, titling, yfonts}

\WarningsOff*
\setlength\parindent{0pt}

\newenvironment{scripture}
  {\hrulefill\begin{itshape}\begin{center}}
  {\par\noindent\hrulefill\end{center}\end{itshape}}

  \hypersetup{
    colorlinks=true,
    linkcolor=blue,
    filecolor=magenta,      
    urlcolor=red,
    pdftitle={Overleaf Example},
    pdfpagemode=FullScreen,
    }
    
% FONT OVERRIDES: --------------------------------------------------------------
\authorfont{\normalsize}

% CUSTOM FONTS: ----------------------------------------------------------------
\usepackage{lipsum}
\usepackage{graphicx}
\usepackage{amsmath}
\usepackage{amssymb}
\usepackage{xcolor}
\usepackage{yfonts}
\usepackage{fontspec}
\usepackage{caption}
\usepackage{subcaption}

\mathchardef\mhyphen="2D

\newfontfamily{\babylonica}{Babylonica}[
Path = fonts/,
Extension = .ttf,
UprightFont = *-Regular
]

\newfontfamily{\yujiboku}{YujiBoku}[
Path = fonts/,
Extension = .ttf,
UprightFont = *-Regular
]

\newfontfamily{\reeniebeanie}{ReenieBeanie}[
Path = fonts/,
Extension = .ttf,
UprightFont = *-Regular
]

\newfontfamily{\permanentmarker}{PermanentMarker}[
Path = fonts/,
Extension = .ttf,
UprightFont = *-Regular
]

\newfontfamily{\rocksalt}{RockSalt}[
Path = fonts/,
Extension = .ttf,
UprightFont = *-Regular
]

\newfontfamily{\nosifer}{Nosifer}[
Path = fonts/,
Extension = .ttf,
UprightFont = *-Regular
]

\newfontfamily{\cinzel}{Cinzel}[
Path = fonts/,
Extension = .ttf,
UprightFont = *-Regular,
BoldFont = *-Bold
]

\newfontfamily{\tangerine}{Tangerine}[
Path = fonts/,
Extension = .ttf,
UprightFont = *-Regular,
BoldFont = *-Bold
]

\newfontfamily{\zillaslab}{ZillaSlabHighlight}[
Path = fonts/,
Extension = .ttf,
UprightFont = *-Regular,
BoldFont = *-Bold
]


% SIZE, MARGINS: ---------------------------------------------------------------
\ifnum\numColumns=1
    \geometry{a3paper, top=22mm, left=14mm, right=14mm, bottom=18mm}
    \setlength{\droptitle}{-3.8em}
    \setlength{\columnsep}{5mm}
\fi

% HEADERS: ---------------------------------------------------------------------
\pagestyle{fancy}
\fancyhf{}
\fancyhead[C]{{\footnotesize\textbf{\theDate}}}
\fancyhead[LE,RO]{\textgoth{\theTitle} -- {\footnotesize\textbf{Vol. \theVolume}}}
\fancyhead[RE]{{\footnotesize\textbf{International}} -- \textbf{\thepage}}
\fancyhead[LO]{{\textbf{\thepage} -- \footnotesize\textbf{International}}}
\renewcommand{\headrule}{\vspace*{-2.5mm}\hspace*{-0.5mm}\noindent{\scriptsize\dotfill\hspace*{-0.5mm}}}

\fancypagestyle{front}{%
    \fancyhf{}
    \fancyhead[C]{{\footnotesize\textbf{\theDate}}}
    \fancyhead[L]{{\footnotesize\textbf{Vol. \theVolume\ -- No. \theIssue\ --\ \theLocation}}}
    \fancyhead[R]{{\footnotesize\textbf{\theCost}}}
}
\thispagestyle{front}

% HEADINGS: --------------------------------------------------------------------
\setcounter{secnumdepth}{0}% Levels of heading that will be numbered.

\titlespacing\numberless{0pt}{14pt}{4pt}
\titlespacing\section{0pt}{14pt}{4pt}
\titlespacing\subsection{0pt}{14pt}{4pt}
\titlespacing\subsubsection{0pt}{14pt}{4pt}
\titleformat*{\section}{\Large\bfseries\scshape}
\titleformat*{\subsection}{\bfseries\scshape}
\titleformat*{\subsubsection}{\bfseries\scshape}
\titleformat*{\paragraph}{\bfseries\scshape}

\RenewDocumentCommand{\h}{m}{%
    \section{#1}%
}
\RenewDocumentCommand{\hh}{m}{%
    \subsection{#1}%
}
\RenewDocumentCommand{\hhh}{m}{\hh{#1}}
\RenewDocumentCommand{\hhhh}{m}{\hh{#1}}

% CAPTIONS: --------------------------------------------------------------------
\captionsetup{
    format=plain, labelfont=bf, font=scriptsize,
    justification=raggedright, singlelinecheck=false
}

% LAYOUT: ----------------------------------------------------------------------
\wrap{%
    \oldtitle{}

    \begin{figure}[H]%
        \begin{minipage}[H]{0.20\columnwidth}%
            \centering{\small\textit{"\theSubtitle"}}
        \end{minipage}%
        \begin{minipage}[H]{0.6\columnwidth}%
            \begin{center}\scalebox{2}{\Huge\textgoth{\theTitle}}\end{center}
        \end{minipage}%
        \begin{minipage}[H]{0.20\columnwidth}%
            \centering{\small\textit{Editorial Board:\\ Alshival.Ai}}
        \end{minipage}%
    \end{figure}
    \vspace*{-7.5mm}
    \vspace*{-1mm}\hspace*{-0.5mm}\noindent{\scriptsize\dotfill\hspace*{-0.5mm}}

    \oldauthor{}
    \olddate{}
    \addMetadata

    \begin{multicols}{3}
}{
    \end{multicols}
}
