\ProvidesClass{ks}

\LoadClassWithOptions{meeting}

\RequirePackage[utf8]{inputenc}
\RequirePackage{color}
\RequirePackage{graphicx}
%\usepackage{graphics}

\addtolength{\hoffset}{-1.5cm}
\addtolength{\voffset}{-1cm}
\addtolength{\textheight}{2cm}
\addtolength{\footskip}{1cm}
%\addtolength{\headheight}{1cm}

\addtolength{\textwidth}{3cm}
\setlength{\parindent}{0cm}
\setlength{\parskip}{0.2cm}

\newcommand{\punkt}[1]{\meetingitem{#1}}
\newcommand{\underpunkt}[1]{\submeetingitem{#1}}
\newcommand{\underunderpunkt}[1]{\subsubmeetingitem{#1}}
\newcommand{\beslut}[1]{\decision{#1}}
\newcommand{\beslutlista}{
  \decisionlist
}

\pagestyle{fancyplain}
\renewcommand{\headrulewidth}{0.0cm}
%\lfoot{Hövdingagatan ?\\??? ?? Hägersten}
%\cfoot{info@ornsberg.org\\www.ornsbergornsberg.org}
%\rfoot{\parbox{Telefon: 08 - ?? ?? ??\\info@ornsberg.org}}
\fancyhead{}
\fancyfoot{}
\fancyfoot[l]{\hrule\vspace{0.1cm}
  \begin{footnotesize}
  \parbox{2.2cm}{\bf Besöksadress:\\\phantom{b}} %
  \parbox{3.0cm}{Hövdingagatan 22\\126 51 Hägersten}
  \parbox{1.6cm}{\bf E-post:\\Hemsida:}
  \parbox{2.9cm}{ko@ornsberg.org\\www.ornsberg.org}
  \parbox{2.8cm}{\bf Tel. Rotundan:\\Tel. Ordförande:}
  \parbox{2.5cm}{08 - 645 77 31\\073 - 673 23 03}
  \end{footnotesize}
}


\newcounter{chairCount}
\newcommand{\chair}[1]{
  \newcommand{\@chair}{#1}\stepcounter{chairCount}
}

\newcommand{\oldattestant}[1]{
  \newcommand{\@oldattestant}{#1}
}

\newcommand{\secretary}[1]{
  \newcommand{\@secretary}{#1}
}

\AtEndDocument{
  \ifthenelse{\value{chairCount} > 0}{
    \vspace{2cm}
    \rule{8cm}{0.02cm}\\
    \@chair, \txt@chair
  }{}

  \attestants
}

\newenvironment{beskrivning}[0]%
{
  \begin{list}{}{%
      \setlength{\oddsidemargin}{2cm}%
}
  \item[]
}{
  \end{list}
}

\newcommand{\att}[1] {

  \vspace{-0.5cm}
  \begin{enumerate}
  \item[\begin{bf}att\end{bf}]{#1}
  \end{enumerate}
  \vspace{-0.3cm}
}

\newcommand{\protokoll}{

\noindent \hspace{0.5cm} {\begin{huge}\bf \txt@minutes \end{huge}}\\
}

\newcommand{\dagordning}{

\noindent \hspace{0.5cm} {\begin{huge}\bf \txt@agenda \end{huge}}\\
}

\newcommand{\tmpdagordning}{

\noindent \hspace{0.5cm} {\begin{huge}\bf \txt@tmpagenda \end{huge}}\\
}

\newcommand{\meetingname}[1]{
  \newcommand{\@meetingname}{#1}
  %\def\@meetingname{#1}
}
\newcommand{\meetingtime}[1]{
  \newcommand{\@meetingtime}{#1}
  %\def\@meetingtime{#1}
}
\newcommand{\meetingplace}[1]{
  \newcommand{\@meetingplace}{#1}
  %\def\@meetingplace{#1}
}

\newcommand{\huvud}{
  \phantom{invisible text to give reference for vspace}
  \vspace{-3cm}
  \hspace{-0.3cm}
  \begin{center}
  \includegraphics[width=0.15\textwidth]{ornsberg.pdf}
  \begin{minipage}{0.6\textwidth}
    \center
    \vspace{-2.5cm}
           {\Huge Örnsbergs Scoutkår}\\\vspace{0.2cm}
           {\LARGE \@meetingname}\\
           {\LARGE \@meetingtime}\\
           {\LARGE \@meetingplace}\\
  \end{minipage}
  \includegraphics[width=0.15\textwidth]{lilja.pdf}
  \end{center}
  \vspace{-0.5cm}
  \rule{\textwidth}{0.05cm}
  \vspace{0.2cm}
}

\newcommand{\signatureChair}[1]{

  \vspace{1cm}
  \rule{8cm}{0.02cm}\\
  #1, \txt@chair
}

\newcommand{\signatureSecretary}[1]{

  \vspace{1cm}
  \rule{8cm}{0.02cm}\\
  #1, \txt@secretary
}

\newcommand{\signatureAttestant}[1]{

  \vspace{1cm}
  \rule{8cm}{0.02cm}\\
  #1, \txt@attestant
}

\newcommand{\signature}[2]{

  \vspace{1cm}
  \rule{8cm}{0.02cm}\\
  #1, #2
}


\newlistof{arenden}{are}{}
\cftpagenumbersoff{arenden}

\newenvironment{arenden}{
  
  \vspace{1.5cm}
  {\bf \Large Ärenden}
  \nopagebreak

  \begin{tabular}{|l|l|l|l|}\hline
    \bf Ärende&\bf Status&\bf Öppnat&\bf Ansvarig
}{
  \\\hline
  \end{tabular}
  
  \listofarenden
}

\newcommand{\arende}[5]{
  \\\hline #1&#2&#3&#4
  %\addcontentsline{are}{arenden}{{\bf \large #1}\vspace{0.1cm}}
  %\addcontentsline{are}{arenden}{\noindent#5\vspace{0.4cm}}
  %\addcontentsline{are}{arenden}{\makebox[8cm]{#5\vspace{0.4cm}}}
  \addcontentsline{are}{arenden}{{\bf \hspace{0.4cm} \large #1}\newline#5\newline\vspace{-0.2cm}}
}
