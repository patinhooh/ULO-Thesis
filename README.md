<p align="center">
    <img width="60%" src="Assets/04_Logo.png" alt="Logo">
</p>

<p align="center">
    <a href="https://github.com/patinhooh/ULO-Thesis/issues/new?labels=bug">Report a Bug</a>
    ·
    <a href="https://github.com/patinhooh/ULO-Thesis/issues/new?labels=enhancement">Request a Feature</a>
    ·
    <a href="https://github.com/patinhooh/ULO-Thesis/issues/new?labels=question">Ask a Question</a>
</p>

<p align="center">
    <a href="https://www.latex-project.org"><img src="https://img.shields.io/badge/Made%20with-LaTeX-red.svg?style=flat-square" alt="Made with LaTeX"></a>
    <a href="https://www.latex-project.org/lppl/lppl-1-3c"><img src="https://img.shields.io/badge/License-LPPL%20v1.3c-yellow.svg?style=flat-square" alt="LPPL 1.3c License"></a>
    <a href="https://github.com/patinhooh/ULO-Thesis/releases"><img src="https://img.shields.io/github/v/tag/patinhooh/ULO-Thesis?style=flat-square&label=Release&color=8892BF" alt="Latest release"></a>
    <a href="https://github.com/patinhooh/ULO-Thesis/graphs/commit-activity"><img src="https://img.shields.io/badge/Maintained-Yes-brightgreen.svg?style=flat-square" alt="Maintained"></a>
    <a href="https://github.com/patinhooh/ULO-Thesis/actions/workflows/build-latex.yml"><img src="https://github.com/patinhooh/ULO-Thesis/actions/workflows/build-latex.yml/badge.svg?branch=changes" alt="Build status"></a>
</p>

<br/>

**ULO Thesis** is an open-source LaTeX template for creating professional theses, dissertations, and academic reports, tailored for students at the [University of Leiria and Oeste](https://www.ulo.pt/). It aims to provide a clean, professional design while remaining customizable and accessible to new LaTeX users.

This repository is a community-maintained fork of the ULO Thesis template, with additional development tooling, build workflow improvements, and template modifications.

## Origin and Attribution

This project builds upon the work of the following projects:

- **Original template:** [IPLeiria Thesis](https://github.com/joseareia/ipleiria-thesis), originally created by [José Areia](https://github.com/joseareia).
- **Intermediate fork:** [ULO Thesis by M. Frade](https://github.com/mfrade/ULO-thesis), adapted for the University of Leiria and Oeste.
- **This fork:** [ULO Thesis by patinhooh](https://github.com/patinhooh/ULO-Thesis), maintained independently with additional template, tooling, and workflow changes.

Credit for the original template design and engineering belongs to the original authors. This fork retains that lineage while maintaining its own changes and development workflow. For details about modifications, see [CHANGELOG.md](CHANGELOG.md).

## Installation and Documentation

The original build methods are preserved for compatibility with the upstream template. This fork also introduces additional build workflows and development tools to suit different preferences and environments. For details on the available options, including the workflows added by this fork, see the [Workflows Guide](WORKFLOWS.md).

The template also includes a **Comprehensive User Guide** chapter within the document, covering the original build methods, metadata, chapters, class options, and other customization features.

## Languages

The template supports **English** and **Portuguese**, selected with the `language` class option in `ULOMain.tex` (`language=english`, the default, or `language=portuguese`).

This option controls the language of fixed template text, including front-page labels, section titles, copyright and AI-use declarations, and captions. In `Metadata/Metadata.tex`, institutional fields can be provided in both languages using `\ByLanguage{<EN>}{<PT>}`. The same macro can be used elsewhere in the document for language-dependent text.

## Getting Help and Reporting Issues

If you encounter a bug, have a question, or want to suggest an improvement specific to this fork, please use the [issue tracker for this repository](https://github.com/patinhooh/ULO-Thesis/issues).

Please include relevant details when reporting a problem, such as your operating system, build environment, LaTeX engine, and the error message or log excerpt.

For issues that also occur in the original template without changes introduced by this fork, you may consult the [intermediate fork](https://github.com/mfrade/ULO-thesis) or the [original IPLeiria Thesis project](https://github.com/joseareia/ipleiria-thesis).

## Contributing

Contributions are welcome. To report a problem or propose a feature, [open an issue](https://github.com/patinhooh/ULO-Thesis/issues). Changes can be submitted through a [pull request](https://github.com/patinhooh/ULO-Thesis/pulls).

Please note that this fork is maintained independently, so changes should target this repository rather than the upstream projects.

## License

The **ULO Thesis** project is released under the terms of the [LaTeX Project Public License (LPPL) version 1.3c](https://www.latex-project.org/lppl/lppl-1-3c/). See the original projects for their respective history and attribution.

