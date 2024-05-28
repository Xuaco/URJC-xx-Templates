\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{unir-tfm}[2024/05/27 URJC LaTeX class by Joaquín Arias]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions\relax
\LoadClass[12pt, a4paper,titlepage]{book}
\RequirePackage[left=3.5cm,top=2cm,right=3cm,includehead]{geometry}

%%%%%%%%%%%%%%%%%%%%%%% Paquetes (no modificar)
\RequirePackage[utf8]{inputenc}
%\RequirePackage[spanish,es-lcroman,es-tabla]{babel}
\RequirePackage[T1]{fontenc}
\RequirePackage[pdftex]{graphicx}
\RequirePackage{mathptmx}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{enumitem}
\RequirePackage[Algoritmo]{algorithm}
\RequirePackage{algorithmic}
\RequirePackage[justification=centering]{caption}
\setlength\abovecaptionskip{0.5em}
\setlength\belowcaptionskip{-0.25em}
\RequirePackage{rotating}
\RequirePackage{booktabs}
\RequirePackage{multirow}
\RequirePackage{xltabular}
\RequirePackage{longtable}
\RequirePackage{pdflscape}
\RequirePackage{relsize}
\RequirePackage{color}
\RequirePackage{xcolor}
\definecolor{linkcolor}{RGB}{52,59,144}
\definecolor{Comment}  {RGB}{169,082,044}
\definecolor{Bluedark} {RGB}{0,0,180}
\definecolor{Bluelight}{RGB}{070,100,250}
\definecolor{Browndark}{rgb}{0.2,0.2,0.2}
\definecolor{gray}{rgb}{0.6,0.6,0.6}

\usepackage{helvet} %% tipo de letra para portada
\definecolor{MyColor}{rgb}{0,0.6,.8}
\usepackage{sectsty}
\chapterfont{\color{MyColor}}  % sets colour of chapters
\sectionfont{\color{MyColor}}  % sets colour of sections
\subsectionfont{\color{MyColor}} % ...


%%%%%%%%%%%%%%%%%%%%%%% Estilo de bibliografia
\RequirePackage{csquotes}
\PassOptionsToPackage{
  natbib=true,
  style=bwl-FU,%	authoryear-comp,
  maxbibnames=99,
  firstinits=true,
  backend=bibtex,
}   {biblatex}
\RequirePackage{biblatex}
\DeclareNameAlias{sortname}{last-first} 

\DeclareCiteCommand{\cite}[\mkbibparens]
{\usebibmacro{prenote}}
{\usebibmacro{citeindex}%
  \printtext[bibhyperref]{\printnames[cite]{labelname} \printfield[cite]{year}}}%{\usebibmacro{cite}}}
{\multicitedelim}
{\usebibmacro{postnote}}
% Titles in bold
\DeclareFieldFormat*{title}{\textbf{#1}}

\DeclareCiteCommand{\citetitle}
{\usebibmacro{prenote}}
{\usebibmacro{citeindex}%
  \printtext[bibhyperref]{\printfield[cite]{labeltitle} (\printfield[cite]{year})}}
{\multicitedelim}
{\usebibmacro{postnote}}

%%%%%%%%%%%%%%%%%%%%%%% Estilo de enlaces
\RequirePackage[colorlinks=true,pdftex]{hyperref}
\hypersetup{
  hidelinks,
  pageanchor=true,
  colorlinks,
  linktocpage,
  citecolor=linkcolor,
  urlcolor=linkcolor,
  linkcolor=linkcolor
}
\renewcommand*{\UrlFont}{\ttfamily\small\relax}
    
%%%%%%%%%%%%%%%%%%%%%%% Estilo de páginas
\RequirePackage{fancyhdr}
\pagestyle{fancy}
\fancyhf{}
\setlength{\headheight}{15.2pt}
\renewcommand{\chaptermark}[1]{\markboth{\uppercase{#1}}{}}
\renewcommand*{\headrulewidth}{0pt}
\fancyhead[EL]{\color{MyColor} \textsf{\relsize{-1}{\leftmark\ }} \hrulefill }
\fancyhead[OR]{\color{MyColor} \hrulefill \textsf{\relsize{-1}{\ \nouppercase\rightmark} } }
\fancyfoot[C]{\thepage}

  
%%%%%%%%%%%%%%%%%%%%%%% Estilo de código
\RequirePackage{textcomp}
\RequirePackage{bold-extra}
\RequirePackage{listings}
\newcommand{\code}{\lstinline[
  language={},
  columns=fullflexible,
  basicstyle=\color{Browndark}]
}
\lstdefinestyle{Default}{
  basicstyle = \relsize{-1}\ttfamily\color{Bluelight},
  keywordstyle=\color{Bluedark},
  stringstyle=\color{Browndark},
  commentstyle = \color{Comment},
  numberstyle=\tiny\color{Bluedark},
  xleftmargin=0.5cm,
  numbers=left,
  basewidth = 0.48em,
  columns=fullflexible,
  breaklines,
  breakatwhitespace=true,
  moredelim=*[s][\color{Browndark}]{[}{]},
  moredelim=[s][\color{Bluedark}]{\{}{\}},
  mathescape = true,
  upquote = true,
  inputencoding=utf8,
  extendedchars=true,
  literate      =        % Support additional characters
  {á}{{\'a}}1  {é}{{\'e}}1  {í}{{\'i}}1 {ó}{{\'o}}1  {ú}{{\'u}}1
  {Á}{{\'A}}1  {É}{{\'E}}1  {Í}{{\'I}}1 {Ó}{{\'O}}1  {Ú}{{\'U}}1
  {ä}{{\"a}}1  {ë}{{\"e}}1  {ï}{{\"i}}1 {ö}{{\"o}}1  {ü}{{\"u}}1
  {ñ}{{\~n}}1  {Ñ}{{\~N}}1  {¿}{{?`}}1  {¡}{{!`}}1
  {\\\%}{{\textbackslash\%}}2  {~}{{\raisebox{0.5ex}{\texttildelow}}}1
}
\lstdefinestyle{Python}{style=Default, language=Python}
\lstdefinestyle{Unity}{style=Default, language=[Sharp]C}
\lstdefinestyle{Latex}{style=Default, language=[LaTeX]TeX}
%% Selecciona el estilo por defecto: Python, Unity, Latex, Default, ...
\lstset{style=Latex}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Portada
\renewcommand*{\maketitle}{%
\begin{titlepage}
  \pagestyle{plain}

  \begin{center}
   
    \begin{figure}[H]
      \centering \includegraphics[scale=0.4]{unir-logos.png}
    \end{figure}

    \sf   %% Arial font
    \color{black!70}
    \renewcommand{\baselinestretch}{1.25}

    \vspace{0.4cm}
    \Large
    Universidad Internacional de La Rioja\\
    \normalsize
    Escuela Superior de Ingeniería y Tecnología\\
    \Large
    Universidad de Alcalá\\
    \normalsize
    Escuela de Posgrado\\
    \Large
    Universidad Rey Juan Carlos\\
    \normalsize
    Escuela de Másteres oficiales\\
    
    \vspace{3cm}
    \Large
    {
      \renewcommand{\baselinestretch}{1}
      \grado
    }

    \LARGE
    \textbf{\color{MyColor}\titulotrabajo}
    
    \vfill
    {%
      \renewcommand{\baselinestretch}{1}
      \normalsize
      \begin{tabular}{rl}
        \textbf{Autor/a:} & \textbf{\autor}\\[.5em]
        \textit{Tipo de trabajo:} & \tipotrabajo\\
        \ifthenelse{\equal{\tutor}{}}{}{Directores:} & {\tutor}\\[-.25em]
                          & {\cotutor}\\[.5em]
        Fecha & \fecha \\
      \end{tabular}
    }
       
    \end{center}
  
\end{titlepage}
}


\newenvironment{horizontalpage}%
    {\clearpage\pagebreak[4]\global\pdfpageattr\expandafter{\the\pdfpageattr/Rotate 90}}%
    {\clearpage\pagebreak[4]\global\pdfpageattr\expandafter{\the\pdfpageattr/Rotate 0}}%

    

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Otros ajustes
\let\origdoublepage\cleardoublepage
\renewcommand{\cleardoublepage}{\clearpage{\pagestyle{empty}\origdoublepage}}

% Table dimensions
\setlength{\tabcolsep}{7.5pt} 
\def\arraystretch{1.25}

% Itemize spacing
\setlist{nolistsep, parsep=0.25em}

% Lines and paragraph
\setlength{\parindent}{0cm}
\setlength{\parskip}{1em}
\def\baselinestretch{1}

