%! Class = cs581exam
%! Author = Len Washington III
%! Date = 1/8/24

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cs581exam}[Len Washington III's Document Class]

\LoadClass[12pt,twocolumn]{report}

\RequirePackage{kvoptions}
\SetupKeyvalOptions{
	family=csexam,
	prefix=csexam@
}

\DeclareStringOption{exam}
\DeclareBoolOption[true]{color}

\ProcessKeyvalOptions*

\RequirePackage[title={CS 581 Spring 2024 \csexam@exam\ Cheat Sheet}]{cs581}
\RequirePackage{enumitem}
\RequirePackage{bookmark}
\RequirePackage{alphalph}
\RequirePackage{multirow}
\RequirePackage[fontsize=9pt]{fontsize}

\let\ifcolor\ifcsexam@color

\newlength{\verticalmargin}
\setlength{\verticalmargin}{1em}
\newlength{\horizontalmargin}
\setlength{\horizontalmargin}{1em}
\setlength{\parskip}{0cm}

\geometry{top=\verticalmargin, bottom=\verticalmargin, left=\horizontalmargin, right=\horizontalmargin}

\RequirePackage{enumitem}
\newlist{problems}{enumerate}{2}
\setlist[problems, 1]{
	font=\textbf,
	label=\Alph{problemsi}),
	leftmargin=30pt,
}

\setlist[problems, 2]{
	label=\textbf{(\alph{problemsii})},
	leftmargin=30pt,
}

\linespread{0.9}

\RequirePackage{titlesec}
\titleformat{\section}[runin]
{\large\bfseries}
{Chapter \arabic{section}: }
{0em}
{}

\titleformat{\subsection}[runin]
{\bfseries}
{(\arabic{section}.\arabic{subsection}): }
{0em}
{}