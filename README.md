# NoTeX

The NoTeX document class is a custom LaTeX class designed for comprehensive notetaking and math problem solution typesetting. It extends the amsart class and includes numerous packages and custom commands to enhance functionality and appearance.

## Installation

NoTeX is available through the latest GitHub release. User may also build the document class manually by running `build.py`, and the resulting `notex.cls` and other files will be located in the `dist` subdirectory. Included files are `main.tex`, `example.tex`, `reference.bib`, and `res/rosslogo.pdf`.

# Notable Features

- Modified section hierarchy: Chapters, Modules, and Topics
- - Customizable using `\headertitle{}`, `\subheadertitle{}`, and `\subsubheadertitle{}`
- Built-in environments for Problem, Theorem, Lemma, Corollary, Definition, and more
- - Custom environment for theorem title, color, and other options
- Revamped `proof` environment with a box similar to theorem and lemma
- - Legacy `proof` environment accessible via `legacyproof`
- Optional `\title` definition
- - `lecture` variable for automatic title formatting as Lecture #{lecture}
- Shortcuts for mathematical environments (e.g., `\floor{}`)
- Special commands: `\NoTeX` and `\RossTeX`
- `rosstex` option for problem set typesetting
- - Activated with `\documentclass[rosstex]{notex}`
- - Redefines sections as Problems
- - Modifies subsection and subsubsection formatting
- - Optional Ross Program logo enabled with \enablerosslogo

# Document Options

All document options from amsart class are carried over to NoTeX. Some options, however, are not tested and may produce unexpected results.

NoTeX introduces one custom option, `rosstex`. Enabling `rosstex` repurposes the document into a problem solution typesetting situation. It modifies the format of titles of subsection, and subsubsection to using abc and (i)(ii)(iii) numbering, respectively. It also changes the header format.
