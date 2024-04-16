%! Class = cs581homework
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
\DeclareStringOption[Written]{type}
\DeclareStringOption{duedate}
\DeclareStringOption{points}
\DeclareBoolOption[true]{template}


\ProcessKeyvalOptions*

\RequirePackage[title={CS 581 Spring 2024 \cshomework@type\ Assignment \#0\cshomework@assignment}]{cs581}
\RequirePackage{enumitem}
\RequirePackage{bookmark}
\RequirePackage{alphalph}
\RequirePackage{multirow}

\let\iftemplate\ifcshomework@template

\renewcommand{\maketitle}{
	\textcolor{red}{\cs@author}\\

	{\LARGE\textbf{\cs@title}}\\
	{\Large Due: \textbf{\cshomework@duedate}\\Points: \textbf{\cshomework@points}}\\

	{\Large\textbf{Instructions:}}
	\begin{enumerate}
		\item Use this document template to report your answers.
		Name the complete document as follows:
		\expandafter\ifstrequal\expandafter{\cshomework@type}{Written}%
		{\[ \mbox{LastName\_FirstName\_CS581\_Written0\cshomework@assignment.doc or pdf} \]}%
		{\[ \mbox{LastName\_FirstName\_CS581\_Programming0\cshomework@assignment.zip} \]}

		\textcolor{red}{\textbf{ONLY PDF or MS Word file formats will be accepted.}}
		\item Submit the final document to Blackboard Assignments section before the due date.
		\textbf{No late submissions will be accepted.}
	\end{enumerate}
}
%\renewcommand{\maketitle}{\begin{center}\Large \textbf{\cs@date~Notes}\end{center}}

\setlength{\parindent}{0pt}

\newenvironment{objectives}{
		{\Large\textbf{Objectives:}}
		}{}

\newenvironment{inputdata}{
		{\Large\textbf{Input data file:}}
		}{}

\newenvironment{problemdescription}{
		{\Large\textbf{Problem description:}}
		}{}

\newcommand{\deliverables}{%
	Your submission should include:
	\begin{itemize}
		\item Python code file(s).
		Your py file should be named: \begin{center} cs581\_P0\cshomework@assignment\_AXXXXXXXX.py \end{center}
		where AXXXXXXXX is your IIT A number (\textcolor{red}{this is REQUIRED!}).
		If your solution uses multiple files, make sure that the main (the one what will be run to solve the problem) is named that way and others include your IIT A number in their names as well.
		\item this document with your results and conclusions.
		You should rename is to: \begin{center} LastName\_FirstName\_CS581\_Programming0\cshomework@assignment.doc or pdf \end{center}
	\end{itemize}
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

\newcounter{problem}
\newcounter{subproblem}[problem]

\newcommand{\problem}[1]{\section*{Problem\stepcounter{problem} \arabic{problem} [#1 pts]:}\label{prb:\arabic{problem}}}

\newcommand{\subproblem}[1]{\subsection*{\stepcounter{subproblem}\Alph{subproblem}) [#1 pts]:}\label{subprb:\arabic{problem}.\arabic{subproblem}}}

%\newcommand{\subproblem}{%
%	\pdfbookmark[4]% Level
%	{Problem \the\numexpr\value{problemsi}\makeAlph{problemsii}}% Text
%	{prb:\the\numexpr\value{chapter}.\the\numexpr\value{section}.\number\value{problemsi}\makeAlph{problemsii}}% Name/Label
%	\item\label{prb:\number\value{problemsi}\alph{problemsii}}}

\newcolumntype{P}[1]{>{\centering\arraybackslash}p{#1}}
\newcolumntype{M}[1]{>{\centering\arraybackslash}m{#1}}
\definecolor{tablegray}{HTML}{e7e7e7}

\definecolor{viterbigray}{HTML}{e6e6e6}
\definecolor{viterbipurple}{HTML}{834cad}

\newenvironment{answerbox}{%
	\begin{table}[H]
		\centering
		\begin{tabular}{|p{\textwidth}|}
			\hline
			\textbf{Your answer [show all your work]:}\\
			\hline
			\iftemplate
			\vspace*{1in}
			\fi\\
			\hline
		\end{tabular}
	\end{table}
}{

}