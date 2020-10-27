### Usage

This repository should be cloned into your home directory.

Use `make` to link dotfiles in this directory to the appropriate locations in your home directory.

Some of this repository's functionality is due to submodules. Git does not load these submodules by default. To load them, run `make submodules`.

**Adding New Packages**
To add new git packages to the repo as submodules, run: `git submodule add --depth 1 -- <repository url> <local path>`.
