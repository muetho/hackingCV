\ProvidesClass{hackingcv}[2018/09/20 CV class]
\LoadClass{article}
\NeedsTeXFormat{LaTeX2e}

%----------------------------------------------------------------------------------------
%	 REQUIRED PACKAGES
%----------------------------------------------------------------------------------------

\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage{librebaskerville}
\RequirePackage{tikz}
\RequirePackage{xcolor}
\RequirePackage{pagecolor}
\RequirePackage[absolute,overlay]{textpos}
\RequirePackage{ragged2e}
\RequirePackage{etoolbox}
\RequirePackage{ifmtarg}
\RequirePackage{ifthen}
\RequirePackage{pgffor}
\RequirePackage{marvosym}
\RequirePackage{parskip}
\RequirePackage{fontawesome}
\RequirePackage[hidelinks]{hyperref}
\RequirePackage{intcalc}
\RequirePackage[left=7.6cm,top=0.1cm,right=1cm,bottom=0.2cm,nohead,nofoot]{geometry}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

%----------------------------------------------------------------------------------------
%	 COLORS
%----------------------------------------------------------------------------------------

\definecolor{black}{RGB}{0,0,0}
\definecolor{darkgray}{RGB}{100,100,100}
\definecolor{gray}{RGB}{128,128,128}
\definecolor{lightgray}{RGB}{211,211,211}
\definecolor{darkgreen}{RGB}{0,100,0}
\definecolor{limegreen}{RGB}{50,205,50}
\definecolor{springgreen}{RGB}{0,255,127}
\definecolor{cyan}{RGB}{0,255,255}
\definecolor{blue}{HTML}{0E5484}
\definecolor{white}{RGB}{255,255,255}

% Sidebar color macros
\newcommand{\sidebarBackgroundColor}{black}
\newcommand{\sidebarTitleColor}{limegreen}
\newcommand{\sidebarTextColor}{limegreen}
\newcommand{\sidebarIconColor}{darkgreen}
\newcommand{\skillsBackgroundColor}{darkgreen}
\newcommand{\skillsForegroundColor}{limegreen}

% Main body color macros
\newcommand{\mainBackgroundColor}{darkgray}
\newcommand{\mainSectionColorOne}{gray}			% 1st section color
\newcommand{\mainSectionColorTwo}{lightgray}		% 2nd section color
\newcommand{\mainSubsectionColor}{white}
\newcommand{\mainSectionTitleTextColor}{black}
\newcommand{\mainTextColor}{white}
\newcommand{\mainStrengthColor}{black}
\newcommand{\mainHobbyIconColor}{black}

%----------------------------------------------------------------------------------------
%	 MISC CONFIGURATIONS
%----------------------------------------------------------------------------------------

\pagestyle{empty} 				% Disable headers and footers
\setlength{\parindent}{0pt} 			% Disable paragraph indentation

%----------------------------------------------------------------------------------------
%	 SIDEBAR DEFINITIONS
%----------------------------------------------------------------------------------------

\setlength{\TPHorizModule}{1cm} 		% Left margin
\setlength{\TPVertModule}{1cm} 			% Top margin

\newlength\imagewidth
\newlength\imagescale
\pgfmathsetlength{\imagewidth}{4cm}
\pgfmathsetlength{\imagescale}{\imagewidth/600}

\newlength{\TotalSectionLength} 		% Define a new length to hold the remaining line width after the section title is printed
\newlength{\SectionTitleLength} 		% Define a new length to hold the width of the section title
\newcommand{\profilesection}[1]{%
	\setlength\TotalSectionLength{\linewidth}		% Set the total line width
	\settowidth{\SectionTitleLength}{\huge #1 }		% Calculate the width of the section title
	\addtolength\TotalSectionLength{-\SectionTitleLength}	% Subtract the section title width from the total width
	\addtolength\TotalSectionLength{-2.22221pt}		% Modifier to remove overfull box warning
	\vspace{8pt}						% Whitespace before the section title
	{\color{\sidebarTextColor} \huge #1 \rule[0.15\baselineskip]{\TotalSectionLength}{1pt}}	% Print the title and auto-width rule
}

% Define custom commands for CV info
\newcommand{\cvdate}[1]{\renewcommand{\cvdate}{#1}}
\newcommand{\cvmail}[1]{\renewcommand{\cvmail}{#1}}
\newcommand{\cvnumberphone}[1]{\renewcommand{\cvnumberphone}{#1}}
\newcommand{\cvaddress}[1]{\renewcommand{\cvaddress}{#1}}
\newcommand{\cvhomepage}[1]{\renewcommand{\cvhomepage}{#1}}
\newcommand{\cvgithub}[1]{\renewcommand{\cvgithub}{#1}}
\newcommand{\cvlinkedin}[1]{\renewcommand{\cvlinkedin}{#1}}
\newcommand{\cvname}[1]{\renewcommand{\cvname}{#1}}
\newcommand{\cvjobtitle}[1]{\renewcommand{\cvjobtitle}{#1}}
\newcommand{\profile}[1]{\renewcommand{\profile}{#1}}
\newcommand{\profilepic}[1]{\renewcommand{\profilepic}{#1}}

% Command for printing (round) icons in contact information
% Warning: Keep this in one line - otherwise there are line breaks in the contact information!
\newcommand*\icon[1]{\tikz[baseline=(char.base)]{\node[shape=circle,draw,inner sep=1pt,minimum size=0.8cm, fill=\sidebarIconColor,\sidebarIconColor,text=white] (char) {#1};}}

\newcommand*\hobbyIcon[1]{\tikz[baseline=(char.base)]{\node[shape=rectangle,draw,rounded corners,inner sep=1pt,minimum size=1cm, fill=\mainHobbyIconColor,\mainHobbyIconColor,text=white] (char) {\huge#1};}}

% Command for printing skill progress bars
\newcommand\primarySkills[2]{ 
	\renewcommand{\primarySkills}{
		$\bullet$\quad\textbf{#1:}\\
		\begin{tikzpicture}
			\foreach [count=\i] \x/\y in {#2}{
				\draw[fill=\skillsBackgroundColor,\skillsBackgroundColor] (0,\i) rectangle (6,\i+0.4);
				\draw[fill=\skillsForegroundColor,\skillsForegroundColor](0,\i) rectangle (\y,\i+0.4);
				\node [above right] at (0,\i+0.4) {\x};
				\node at (3,\i+0.2) {\color{black}\y};
			}
		\end{tikzpicture}
		\par\noindent\rule{\textwidth}{0.2pt}
	}
}

\newcommand\secondarySkills[2]{ 
	\renewcommand{\secondarySkills}{
		$\bullet$\quad\textbf{#1:}\\
		\begin{tikzpicture}
			\foreach [count=\i] \x/\y in {#2}{
				\draw[fill=\skillsBackgroundColor,\skillsBackgroundColor] (0,\i) rectangle (6,\i+0.4);
				\draw[fill=\skillsForegroundColor,\skillsForegroundColor](0,\i) rectangle (\y,\i+0.4);
				\node [above right] at (0,\i+0.4) {\x};
				\node at (3,\i+0.2) {\color{black}\y};
			}
		\end{tikzpicture}
		\par\noindent\rule{\textwidth}{0.2pt}
	}
}


% Command for printing skills text
\newcommand\skillstext[2]{ 
	\renewcommand{\skillstext}{
		$\bullet$\quad\textbf{#1:}
		\begin{flushleft}
			\foreach [count=\i] \x/\y in {#2}{ 
				\x$ \star $\y
			}
		\end{flushleft}
	}
}

% Command for printing language skills
\newcommand\languageSkills[1]{ 
	\renewcommand{\languageSkills}{
		$\bullet$\quad\textbf{Languages:}
		\begin{flushleft}
		    \foreach [count=\i] \x/\y in {#1}{ 
		    	\x \hfill \y \\
		    }
		\end{flushleft}
	}
}

\newcommand\skillsinfo[1]{\renewcommand{\skillsinfo}{\scriptsize \faInfoCircle \quad #1}}

%----------------------------------------------------------------------------------------
%	 SIDEBAR LAYOUT
%----------------------------------------------------------------------------------------

\newcommand{\makeprofile}{
	\begin{tikzpicture}[remember picture,overlay]
   		\node [rectangle, fill=\sidebarBackgroundColor, anchor=north, minimum width=9cm, minimum height=\paperheight+1cm] (box) at (-5cm,0.5cm){};
	\end{tikzpicture}

	%------------------------------------------------

	\begin{textblock}{6}(0.5, 0.2)
			
		%------------------------------------------------
		
		\ifthenelse{\equal{\profilepic}{}}{}{
			\begin{center}
				\begin{tikzpicture}[x=\imagescale,y=-\imagescale]
					\clip (600/2, 567/2) circle (567/2);
					\node[anchor=north west, inner sep=0pt, outer sep=0pt] at (0,0) {\includegraphics[width=\imagewidth]{\profilepic}};
				\end{tikzpicture}
			\end{center}
		}

		%------------------------------------------------

		{\Huge\color{\sidebarTitleColor}\cvname}

		%------------------------------------------------

		{\Large\color{\sidebarTextColor}/*\enspace\cvjobtitle\enspace*/}

		%------------------------------------------------

		\renewcommand{\arraystretch}{2.2}
		\color{\sidebarTextColor}
		\begin{tabular}{p{0.5cm} @{\hskip 0.5cm}p{5cm}}
			\ifthenelse{\equal{\cvdate}{}}{}{\textsc{\Large\icon{\faBirthdayCake}} & \cvdate\\}
			\ifthenelse{\equal{\cvaddress}{}}{}{\textsc{\Large\icon{\faMapMarker}} & \cvaddress\\}
			\ifthenelse{\equal{\cvnumberphone}{}}{}{\textsc{\Large\icon{\faPhone}} & \cvnumberphone\\}
			\ifthenelse{\equal{\cvhomepage}{}}{}{\textsc{\Large\icon{\faGlobe}} & \href{https://\cvhomepage}{\cvhomepage}\\}
			\ifthenelse{\equal{\cvgithub}{}}{}{\textsc{\Large\icon{\faGithub}} & \href{https://\cvgithub}{\cvgithub}\\}
			\ifthenelse{\equal{\cvlinkedin}{}}{}{\textsc{\Large\icon{\faLinkedin}} & \href{https://linkedin.com/\cvlinkedin}{\cvlinkedin}\\}
			\ifthenelse{\equal{\cvmail}{}}{}{\textsc{\large\icon{\faEnvelopeO}} & \href{mailto:\cvmail}{\cvmail}}
		\end{tabular}

		%------------------------------------------------
		
		\ifthenelse{\equal{\profile}{}}{}{
			\profilesection{/.profile}
			\profile
		}

		%------------------------------------------------

		\profilesection{/.skills}

		\primarySkills
		\secondarySkills
		\skillstext
		\languageSkills
		\skillsinfo
			
		%------------------------------------------------
			
	\end{textblock}
}

%----------------------------------------------------------------------------------------
%	 COLOURED SECTION TITLE BOX
%----------------------------------------------------------------------------------------

% Change background color of page
\pagecolor{\mainBackgroundColor}

% Command for insertion of fancy current folder (/.) and parent folder (/..) sections
\newcommand{\currentParentFolderSections}{
	\fboxrule=0pt
	\fbox{\colorbox{\mainSectionColorOne}{\makebox[\textwidth][l]{\textcolor{\mainSectionTitleTextColor}{/.}}}}
	\fbox{\colorbox{\mainSectionColorTwo}{\makebox[\textwidth][l]{\textcolor{\mainSectionTitleTextColor}{/..}}}}
}

% Command to create the boxes around section titles
\newcommand*\round[2]{{\fboxrule=0pt\fbox{\colorbox{#2}{\makebox[\textwidth][l]{\textcolor{\mainSectionTitleTextColor}{#1}}}}}}

\newcounter{colorCounter}
% toggle the colors (with counter modulo 2)
\newcommand{\sectioncolor}[1]{%
	{%
		\round{#1}{
			\ifcase\intcalcMod{\value{colorCounter}}{2}%
			\mainSectionColorOne \or%
			\mainSectionColorTwo \else%
			\fi%
		}%
	}%
	\stepcounter{colorCounter}%
}

\renewcommand{\section}[1]{
	{%
		\Large\sectioncolor{/#1}%
	}
}

\renewcommand{\subsection}[1]{
	\par\vspace{.5\parskip}{%
		\large\color{\mainSubsectionColor} #1%
	}
	\par\vspace{.25\parskip}%
}

%----------------------------------------------------------------------------------------
%	 RANDOM TEXT INSERTION
%----------------------------------------------------------------------------------------

\newcommand{\randomtext}[1]{\color{\mainTextColor}#1}

%----------------------------------------------------------------------------------------
%	 STRENGTHS INSERTION
%----------------------------------------------------------------------------------------

\newcommand{\strength}[1]{%
	\tikz[baseline=(char.base)]\node[anchor=north west, draw,rectangle, rounded corners, inner sep=1.6pt, minimum size=5.5mm, text height=3.6mm, fill=\mainStrengthColor,\mainStrengthColor,text=white](char){#1};%
}

%----------------------------------------------------------------------------------------
%	 TRIVIA QUOTE INSERTION
%----------------------------------------------------------------------------------------

\newcommand{\triviaQuote}[2]{%
	\color{\mainTextColor}
	``#1``
	\newline
	\hspace*{1cm}-#2
}

%----------------------------------------------------------------------------------------
%	 LONG LIST ENVIRONMENT
%----------------------------------------------------------------------------------------

\setlength{\tabcolsep}{0pt}

% New environment for the long list
\newenvironment{twenty}{%
	\begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{%
	\end{tabular*}
}

\newcommand{\twentyitem}[4]{%
	\footnotesize
	\color{\mainTextColor}#1&\parbox[t]{0.79\textwidth}{%
		\textbf{\color{\mainTextColor}#2}%
		\hfill%
		{\color{\mainTextColor}\footnotesize#3}\\%
		\ifthenelse{\equal{#4}{}}{}{\footnotesize\color{\mainTextColor}#4\vspace{\parsep}}%
	}\\
}

%----------------------------------------------------------------------------------------
%	 SMALL LIST ENVIRONMENT
%----------------------------------------------------------------------------------------

\setlength{\tabcolsep}{0pt}

% New environment for the small list
\newenvironment{twentyshort}{%
	\begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{%
	\end{tabular*}
}

\newcommand{\twentyitemshort}[2]{%
	\footnotesize
	\color{\mainTextColor}#1&\parbox[t]{0.83\textwidth}{%
		\textbf{\color{\mainTextColor}#2}%
	}\\
}
