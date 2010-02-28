\ProvidesClass{meeting}

\LoadClass[11pt,a4paper]{article}

\RequirePackage[utf8]{inputenc}
\RequirePackage{bbm}
\RequirePackage{fancyhdr}
\RequirePackage{ifthen}
\RequirePackage{tocloft}

\DeclareOption{swedish}{
  \newcommand{\txt@attendants}{Närvarande}
  \newcommand{\txt@absent}{Frånvarande}
  \newcommand{\txt@adjungated}{Adjungerade}
  \newcommand{\txt@decisions}{Sammanfattging av beslut}
  \newcommand{\txt@minutes}{Protokoll}
  \newcommand{\txt@agenda}{Dagordning}
  \newcommand{\txt@tmpagenda}{Förslag till Dagordning}
  \newcommand{\txt@chair}{Ordförande}
  \newcommand{\txt@secretary}{Sekreterare}
  \newcommand{\txt@attestant}{Justerare}
}
\DeclareOption{english}{
  \newcommand{\txt@attendants}{Attendants}
  \newcommand{\txt@absent}{Absent}
  \newcommand{\txt@adjungated}{Adjungated}
  \newcommand{\txt@decisions}{Summary of decisions}
  \newcommand{\txt@minutes}{Minutes}
  \newcommand{\txt@agenda}{Agenda}
  \newcommand{\txt@tmpagenda}{Preliminary Agenda}
  \newcommand{\txt@chair}{Chair}
  \newcommand{\txt@secretary}{Secretary}
  \newcommand{\txt@attestant}{Verifyer}

}
\ProcessOptions\relax

\def\@namedef#1{\expandafter\def\csname #1\endcsname}% defined in kernel 
\def\@nameuse#1{\csname #1\endcsname}% defined in kernel 

\newcounter{meetingitem@counter}
\newcounter{submeetingitem@counter}[meetingitem@counter]
\newcounter{subsubmeetingitem@counter}[submeetingitem@counter]

\newcommand{\meetingitem}[1]{
  \stepcounter{meetingitem@counter}
  \def\@currentlabel{\arabic{meetingitem@counter}}
  
  \vspace{0.2cm}
    \begin{Large}
      \bf {
        \hspace{-0.9cm}\parbox{0.7cm}{\arabic{meetingitem@counter}.} #1\\
      }
      %\vspace{0.0cm}
    \end{Large}\nopagebreak
    
    \vspace{-0.5cm}
}

\newcommand{\submeetingitem}[1]{
  \stepcounter{submeetingitem@counter}
  \def\@currentlabel{\arabic{meetingitem@counter}(\alph{submeetingitem@counter})}%

  \begin{large}
    \bf{
      \hspace{-0.9cm}\makebox[0.7cm][r]{\alph{submeetingitem@counter}.} #1\\
    }
  \end{large}
  \vspace{-0.6cm}\nopagebreak

  %\vspace{-0.3cm}
}

\newcommand{\subsubmeetingitem}[1]{
  \stepcounter{subsubmeetingitem@counter}
  \def\@currentlabel{\arabic{meetingitem@counter}(\alph{submeetingitem@counter})\alph{subsubmeetingitem@counter}}

  {\bf (\alph{subsubmeetingitem@counter}) #1} 
}

\newlistof{attendant}{attend}{\Large \bf \txt@attendants:} 
\cftpagenumbersoff{attendant}
\newlistof{nonAttendant}{nonattend}{\Large \bf \txt@absent:} 
\cftpagenumbersoff{nonAttendant}
\newlistof{adjAttendant}{adjattend}{\Large \bf \txt@adjungated:} 
\cftpagenumbersoff{adjAttendant}

\newcommand{\attendant}[3]{
  \stepcounter{attendant}
  %\def\@tmp{#3}
  \def\@temp{#3}
  \ifx\@empty\@temp\relax
  \def\@temp{#2}
  \ifx\@empty\@temp\relax
  \addcontentsline{attend}{attendant}{\it #1}\par
  \else
  \addcontentsline{attend}{attendant}{\it #1 -- {\footnotesize#2}}\par
  \fi
  \else
  \def\@temp{#2}
  \ifx\@empty\@temp\relax
  \addcontentsline{attend}{attendant}{\it #1 {\footnotesize(#3)}}\par
  \else
  \addcontentsline{attend}{attendant}{\it #1 -- {\footnotesize#2 (#3)}}\par
  \fi
  \fi
}

\newcommand{\nonAttendant}[3]{
  \def\@temp{#3}
  \ifx\@empty\@temp\relax
  \def\@temp{#2}
  \ifx\@empty\@temp\relax
  \addcontentsline{nonattend}{nonAttendant}{\it #1}\par
  \else
  \addcontentsline{nonattend}{nonAttendant}{\it #1 -- {\footnotesize#2}}\par
  \fi
  \else
  \def\@temp{#2}
  \ifx\@empty\@temp\relax
  \addcontentsline{nonattend}{nonAttendant}{\it #1 {\footnotesize(#3)}}\par
  \else
  \addcontentsline{nonattend}{nonAttendant}{\it #1 -- {\footnotesize#2 (#3)}}\par
  \fi
  \fi
}

\newcommand{\adjAttendant}[3]{
  \def\@temp{#3}
  \ifx\@empty\@temp\relax
  \def\@temp{#2}
  \ifx\@empty\@temp\relax
  \addcontentsline{adjattend}{adjAttendant}{\it #1}\par
  \else
  \addcontentsline{adjattend}{adjAttendant}{\it #1 -- {\footnotesize#2}}\par
  \fi
  \else
  \def\@temp{#2}
  \ifx\@empty\@temp\relax
  \addcontentsline{adjattend}{adjAttendant}{\it #1 {\footnotesize(#3)}}\par
  \else
  \addcontentsline{adjattend}{adjAttendant}{\it #1 -- {\footnotesize#2 (#3)}}\par
  \fi
  \fi
}

\newcommand{\attendants}{
  \listofattendant
}
\newcommand{\nonAttendants}{
  \listofnonAttendant
}
\newcommand{\adjAttendants}{
  \listofadjAttendant
}


\newlistof{decisions}{dec}{\Large \bf \txt@decisions}
\cftpagenumbersoff{decisions}

\newcommand{\decision}[1]{
  \refstepcounter{decisions}
  \addcontentsline{dec}{decisions}{\arabic{decisions}. #1}\par
}

\newcommand{\decisionlist}{

  \vspace{-0.5cm}
  \listofdecisions
  \rule{\textwidth}{0.05cm}
  \vspace{0.3cm}
}

\newcounter{hereCount}

\newcommand{\meetingHere}[1]{
  \@namedef{here\arabic{hereCount}}{#1}
  \stepcounter{hereCount}
}

\newcounter{printHereCount}

\newcommand{\meetingListHere}{\ifthenelse{\value{printHereCount} = 0}{{\bf \large \txt@attendants: }\@nameuse{here\arabic{printHereCount}}\stepcounter{printHereCount}\meetingListHere}{\ifthenelse{\value{printHereCount} < \value{hereCount}}{, \@nameuse{here\arabic{printHereCount}}\stepcounter{printHereCount}\meetingListHere}{}
  }
}

\newcounter{attestantCount}

\newcommand{\attestant}[1]{
  \@namedef{attestant\arabic{attestantCount}}{#1}
  \stepcounter{attestantCount}
}

\newcounter{printAttestantCount}

\newcommand{\attestants}{
  \ifthenelse{\value{printAttestantCount} < \value{attestantCount}} {
    \vspace{1cm}
    \rule{8cm}{0.02cm}\\
    \@nameuse{attestant\arabic{printAttestantCount}}, \txt@attestant
    \stepcounter{printAttestantCount}

    \attestants
  }{}
}

