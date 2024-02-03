%! Class = cs581notes
%! Author = Len Washington III
%! Date = 1/8/24

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cs581homework}[Len Washington III's Document Class]

\LoadClass[12pt]{report}

\RequirePackage{kvoptions}
\SetupKeyvalOptions{
	family=cshomework,
	prefix=cshomework@
}

\DeclareStringOption{assignment}
\DeclareStringOption{duedate}
\DeclareStringOption{points}

\ProcessKeyvalOptions*

\RequirePackage[title={CS 581 Spring 2024 Written Assignment \#0\cshomework@assignment}]{cs581}
\RequirePackage{enumitem}
\RequirePackage{bookmark}
\RequirePackage{alphalph}
\RequirePackage{multirow}

\renewcommand{\maketitle}{
	{\LARGE\textbf{\cs@title}}\\
	{\Large Due: \textbf{\cshomework@duedate}\\Points: \textbf{\cshomework@points}}\\

	{\Large\textbf{Instructions:}}
	\begin{enumerate}
	    \item Use this document template to report your answers.
		Name the complete document as follows:
		\[ \mbox{LastName\_FirstName\_CS581\_WA0\cshomework@assignment.doc or pdf} \]

		\textcolor{red}{\textbf{ONLY PDF or MS Word file formats will be accepted.}}
		\item Submit the final document to Blackboard Assignments section before the due date.
		No late submissions will be accepted.
	\end{enumerate}
}
%\renewcommand{\maketitle}{\begin{center}\Large \textbf{\cs@date~Notes}\end{center}}

\setlength{\parindent}{0pt}

\NewEnviron{objectives}{
	{\Large\textbf{Objectives:}}
	\BODY
}

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

\newcommand*\makeAlph[1]{\alphalph{\the\numexpr\value{#1}+1}}

\newcounter{problems}
\setcounter{problems}{0}
%\newcommand{\problem}[2][prb:\cshomework@assignment.\number\value{problems}]{%
%	\pdfbookmark[2] % Level
%	{Problem \the\numexpr\value{problems}+1\ifx#1\empty\else#1 pts\fi:} % Text
%	{#2}% Name/Label
%}

\newcommand{\problem}[2][]{\section{Problem #2 [#1 pts]:}\label{prb:#2}}

\newcommand{\subproblem}{%
	\pdfbookmark[4]% Level
	{Problem \the\numexpr\value{problemsi}\makeAlph{problemsii}}% Text
	{prb:\the\numexpr\value{chapter}.\the\numexpr\value{section}.\number\value{problemsi}\makeAlph{problemsii}}% Name/Label
	\item\label{prb:\number\value{problemsi}\alph{problemsii}}}