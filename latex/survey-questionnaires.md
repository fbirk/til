# Survey Questionnaires

The LaTeX environment is very useful to create beautiful articles, reports, papers and more. With the [SurveyAMC Project](https://survey.codes/surveyamc/) by the University of Potsdam, Germany it is also possible to create survey questionnaires for research projects. The projects consists out of two parts:

## LaTeX packages

The *surveyamc* packages contains the styling description for question and answer boxes in every needed form and color.

Usage:

```latex
\usepackage{automultiplechoice}
\surveyamc

\begin{variable-single}{sex}{77}
  \begin{values}
    \answer{male \dotfill}{0,4}{vallab-sc, text width=4cm}{checkbox-sc}\scoring{b=1}
    \answer{female \dotfill}{0,3}{vallab-sc, text width=4cm}{checkbox-sc}\scoring{b=2}
    \answer{other \dotfill}{0,2}{vallab-sc, text width=4cm}{checkbox-sc}\scoring{b=3}
  \end{values}
\end{variable-single}
```

The above example describes a single-choice variable (`variable-single`) for the sex of the survey attendee as checkboxes (`{checkbox-sc}`) with three answer possibilities. The scoring at the end is later used for the automated answer procession.

## Auto Multiple Choice

The LaTeX file does not only consists out of styling information, but also generates a metafile for all answers. This metafile is then used to automatically process the answers with the [Auto Multiple Choice Software](https://www.auto-multiple-choice.net/index.en), an open source project to read manually filled survey sheets via image recognition.

-------------------------------------------
*[back to the main page](../readme.md)*
