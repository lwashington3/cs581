%! Class = cs581notes
%! Author = Len Washington III
%! Date = 1/8/24

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cs581notes}[Len Washington III's Document Class]

\LoadClass[12pt]{report}

\RequirePackage{cs581}
\RequirePackage{enumitem}

\renewcommand{\maketitle}{\begin{center}\LARGE \textbf{\cs@title}\end{center}}
%\renewcommand{\maketitle}{\begin{center}\Large \textbf{\cs@date~Notes}\end{center}}

%\renewcommad{\arry}{1.3}
\newcommand{\header}[1]{\textcolor{white}{#1}}


\setlength{\parindent}{0pt}

\newcommand{\Peas}{P}
\newcommand{\pEas}{E}
\newcommand{\peAs}{A}
\newcommand{\peaS}{S}

\RequirePackage{titlesec}

\titleformat{\chapter}
{\huge\bfseries}
{}
{0em}
{}

\titleformat{\section}
{\LARGE\bfseries}
{}
{0em}
{}

\titleformat{\subsection}
{\Large\bfseries}
{}
{0em}
{}