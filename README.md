# NYC Vim Meetup: Tmux Tutorial

Source code for my [Vim](https://www.vim.org/about.php) / [Tmux](http://man.openbsd.org/OpenBSD-current/man1/tmux.1) tutorial. This tutorial will be shared at [The New York City Vim Meetup](https://www.meetup.com/The-New-York-Vim-Meetup/).

## Setup

This tutorial relies on Docker to create a cross-platform Ubuntu 18.04 development environment.

### Dependencies

* [Docker](https://docs.docker.com/install/)
* [GNU Make](https://www.gnu.org/software/make/)

### Run Instructions

In this directory, run the following shell command:

```bash
make
```

### Clean Up

In this directory, run the following shell command:

```bash
make clean
```

## Slides

I've provided a hovercraft presentation in the "slides/" subdirectory. Follow the instructions in the README to build.

## Tmux Documentation

Most information about Tmux can be found in its man page:

```bash
man tmux
```

Some less-comprehensive resources are found here:

* [Cheat Sheet (List)](https://gist.github.com/MohamedAlaa/2961058)
* [Cheat Sheet (Chart)](http://atkinsam.com/documents/tmux.pdf)
* [Another Cheat Sheet](https://alvinalexander.com/linux-unix/tmux-cheat-sheet-commands-pdf)

## Written By

Samuel Roeca *samuel.roeca@gmail.com*
