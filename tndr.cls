\ProvidesClass{tndr}

\LoadClassWithOptions{meeting}

\RequirePackage[utf8]{inputenc}
\RequirePackage{color}
\RequirePackage{graphicx}
%\usepackage{graphics}

\DeclareOption{swedish}{
  \newcommand{\txt@tndr}{Teknisk-naturvetenskapliga doktoranrådet}
}
\DeclareOption{english}{
  \newcommand{\txt@tndr}{PhD Students Board of the Technical and Naturas Sciences Faculty}
}
\ProcessOptions\relax

\addtolength{\hoffset}{-1.5cm}
\addtolength{\voffset}{-1cm}
\addtolength{\textheight}{2cm}
\addtolength{\footskip}{1cm}
%\addtolength{\headheight}{1cm}

\addtolength{\textwidth}{3cm}
\setlength{\parindent}{0cm}
\setlength{\parskip}{0.2cm}

\pagestyle{fancyplain}
\renewcommand{\headrulewidth}{0.0cm}


\newcommand{\chair}[1]{
  \newcommand{\@chair}{#1}
}

\newcommand{\oldattestant}[1]{
  \newcommand{\@oldattestant}{#1}
}

\newcommand{\secretary}[1]{
  \newcommand{\@secretary}{#1}
}

\AtEndDocument{
  \vspace{2cm}
  \rule{8cm}{0.02cm}\\
  \@chair, Ordförande

  \attestants
}

\newcommand{\minutes}{

\noindent \hspace{0.5cm} {\begin{huge}\bf \txt@minutes \end{huge}}\\
}

\newcommand{\agenda}{

\noindent \hspace{0.5cm} {\begin{huge}\bf \txt@agenda \end{huge}}\\
}

\newcommand{\tmpagenda}{

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

\newcommand{\head}{
  \phantom{invisible text to give reference for vspace}
  \vspace{-3cm}
  \hspace{-0.3cm}
  \begin{center}
  \begin{minipage}{1.0\textwidth}
    \center
    \vspace{-2.5cm}
           {\Huge \txt@tndr}\\
           {\LARGE \@meetingname}\\
           {\LARGE \@meetingtime, \@meetingplace}\\
  \end{minipage}
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
