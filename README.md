### Usage

This repository should be cloned into your home directory.

Use `make` to link dotfiles in this directory to the appropriate locations in your home directory.

To ensure git submodules are present (vim packages are submodules) on a given repo copy, you may need to run:  
```
git submodule init
git submodule update
```

**Vim**  
To add git packages to the repo, run: `git submodule add --depth 1 -- <repository url> <local path>`
