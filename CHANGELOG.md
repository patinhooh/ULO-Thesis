# Changelog

All notable differences accumulated across this fork and its upstream forks, relative to the original [IPLeiria Thesis](https://github.com/joseareia/ipleiria-thesis) template by José Areia, are documented here. The intermediate [ULO Thesis](https://github.com/mfrade/ULO-thesis) fork is also part of this project's history.

## Branding

- Replaced the Polytechnic of Leiria / IPLeiria ESTG logo with the University of Leiria and Oeste (ULO) / ESTG logo, in both light-background and dark-background (cover) variants.
- Replaced "Polytechnic University of Leiria" with "University of Leiria and Oeste" throughout the metadata, the cover, and the legal declaration text (PT/EN) in the Copyright page.
- Removed the `utnfrba` school option (UTN-FRBA), whose logo was never included in the repository.
- Updated the README with repository-specific links, support channels, and attribution to the original template and intermediate fork.

## Renamed files

- `IPLeiriaMain.tex` → `ULOMain.tex`
- `IPLeiriaThesis.cls` → `ULOThesis.cls` (including its internal LaTeX3 namespace, e.g. `\g_IPLeiriaThesis_...` → `\g_ULOThesis_...`)
- `Chapters/Appendices/00-AppendixA.tex` → `Chapters/Appendices/00-AppendixAI.tex`
- Build tooling (`Makefile`, `.latexmkrc`, GitHub Actions workflow) updated to match.
- Moved appendix source files from `Chapters/Appendices/` to `Appendices/` and the annex source file from `Chapters/Annexes/` to `Annexes/`, updating the paths in `ULOMain.tex`.

## Versioning

- The template has its own version numbering, defined once in `\TemplateVersion` (`ULOMain.tex`) and used in the class and in Chapter 1. Version 1.0.0 is the fork as first published; 2.0.0 adds the changes below (language handling, metadata fields). It is based on IPLeiria Thesis 2.2.13.

## Documentation

- Added `WORKFLOWS.md` documenting local development with `mise`, VS Code Dev Containers, and container workflows.
- Updated the README to link to the workflow guide and clarify that the original build methods remain available alongside the additional workflows introduced by this fork.

## Build

- Added landscape-mode geometry patch now maps `\pdfpagewidth`/`\pdfpageheight` to LuaTeX's `\pagewidth`/`\pageheight`.
- `.latexmkrc` now works on Windows: the `.aux` subfolders are created in Perl (previously with `find`/`sed`/`xargs`), and `makeglossaries` is called without shell quoting.
- Added `@default_files = ('ULOMain.tex')` to `.latexmkrc` for VimTeX.
- Added `mise.toml` with tasks for building, cleaning, rebuilding, watching, formatting, environment setup, and Docker/Podman workflows.
- Added a `Containerfile` based on Debian Bookworm Slim and replaced the root `.devcontainer.json` configuration with `.devcontainer/devcontainer.json`, using the project container and configuring LaTeX Workshop and LaTeX Utilities extensions.
- Added `.latexindent.yaml` to configure LaTeX source formatting and `.chktexrc` to configure ChkTeX linting.
- Updated VS Code settings to enable automatic builds on save, use `latexindent` for formatting, enable ChkTeX linting, and build through `mise`.
- Updated `.gitignore` to ignore root-level PDF outputs while allowing PDFs in subdirectories to remain trackable; removed the template ZIP ignore rule.
- Added bundled Lato font files (`Lato-Regular.ttf`, `Lato-Bold.ttf`, `Lato-Italic.ttf`, and `Lato-BoldItalic.ttf`) and configured `\latofont` to load them from `Configurations/Fonts/`.

## Continuous integration

- Replaced `.github/workflows/latex.yml` with `.github/workflows/build-latex.yml`.
- Changed workflow path filtering from a denylist to an allowlist.
- Changed artifact publication to upload `ULOMain.pdf` directly as pdf, without wrapping it in an archive, with a 90-day retention period.
- Removed the GitHub Pages deployment and PDF preview-generation steps.

## Languages

- Removed Spanish support; the `language` option now accepts only `english` and `portuguese`.
- Added `\ByLanguage{<EN>}{<PT>}` to select text by the document language, used in `Metadata/Metadata.tex` for the institutional fields and thesis type.
- Front page labels (student number, supervisor, co-supervisor), the bibliography title, and `block` titles (To-Do, Tip, Warning, Note) now follow the document language.
- Fixed the abstract section to display only the language selected by the user.

## Metadata

- Removed the supervisor e-mail fields (`\SupervisorMail`, `\CoSupervisorMail`, `\SecCoSupervisorMail`), since reports are published online and exposed addresses attract spam.
- Supervisor title and affiliation fields now use `\ByLanguage`, with English and Portuguese versions.
- Added commented examples in Configurations/11-Metadata.sty and Metadata/Metadata.tex showing how to extend the metadata configuration for a third co-supervisor.

## AI Use Declaration & Appendix

- Strengthened the AI Use Declaration to require documenting AI interactions "to the greatest extent possible," rather than a single illustrative example.
- Moved the sample AI interaction out of the declaration and into its own appendix, now titled "Documented Examples of AI Usage," cross-referenced from the declaration via `\autoref`.
- Replaced the single generic example with six realistic, subject-agnostic examples: grammar/spelling check, improving academic tone, code generation (with a syntax-highlighted listing), literature search support, condensing a section, and generating a LaTeX table (with a syntax-highlighted listing).

## Typography and bibliography

- Changed the citation style from author–year to compressed numeric citations (`numeric-comp`).
- Changed the bibliography style to IEEE (`ieee`) and set reference sorting to `none`.

## Class behavior and document appearance

- Added `\glsdisablehyper` to disable hyperlinks generated by the glossaries package.
- Added the `todonotes` package with options to include todos in the list of todos and configure their width and text size, enabling todo notes that dont interfere with page layout.
- Removed the `psvectorian` package dependency and replaced its compile-time ornament with the bundled `Figures/Theme/Ornament.pdf` asset on the Copyright page.
- Changed the separator between the copyright year and author information from a hyphen to an em dash in both the Portuguese and English copyright text.

## Fixes

- User guide corrections: glossary/acronyms/symbols file names, the `aiacknowledgement` option name, the `docstage` default, swapped `chapterstyle`/`coverstyle` descriptions, a note that only `estg` has the ULO logo, and the Overleaf free-plan compile limit (with OpenAI Prism as an alternative).

- Appendices/Annexes chapter lettering now runs consecutively (A, B, C, ...) instead of Annexes jumping to "L" due to a hardcoded `\setcounter{chapter}{11}` left over from the original template.
- Fixed PDF navigation: clicking a chapter in the Table of Contents or the PDF bookmark panel no longer jumps to an unexpected horizontal scroll position. Root cause was hyperref's default `XYZ`-type destinations; fixed via `pdfview=FitH`.
- Fixed a `\textcolor{}{}` compile error (blank lines aren't allowed inside a macro argument) by switching to the `color` environment for a multi-paragraph credits block.

## Repository

- Removed the inherited `.github/FUNDING.yml` sponsorship configuration.
- Maintained as a fork of [mfrade/ULO-thesis](https://github.com/mfrade/ULO-thesis), which builds upon the original [IPLeiria Thesis](https://github.com/joseareia/ipleiria-thesis) template.
- Fork-specific changes and development tooling are maintained at [patinhooh/ULO-Thesis](https://github.com/patinhooh/ULO-Thesis).
