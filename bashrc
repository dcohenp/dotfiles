# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples.

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Define some colors
if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    # We have color support; assume it's compliant with Ecma-48
    # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
    # a case would tend to support setf rather than setaf.)
    color_prompt=yes
    BOLD_RED="\[\e[01;31m\]"
    BOLD_GREEN="\[\e[01;32m\]"
    BOLD_BLUE="\[\e[01;34m\]"
    RED="\[\e[00;31m\]"
    GREEN="\[\e[00;32m\]"
    BLUE="\[\e[00;34m\]"
    NO_COLOR="\[\e[m\]"

else
    color_prompt=
    BOLD_RED=
    BOLD_GREEN=
    BOLD_BLUE=
    RED=
    GREEN=
    BLUE=
    NO_COLOR=
fi

# Function to assemble the Git part of our prompt.
# Based on https://gist.github.com/828432
git_prompt () {
    if ! git rev-parse --git-dir > /dev/null 2>&1; then
        return 0
    fi

    git_branch=$(git branch 2>/dev/null| sed -n '/^\*/s/^\* //p')

    if git diff --quiet 2>/dev/null >&2; then
        git_color="${GREEN}"
    else
        git_color="${RED}"
    fi

    echo "[$git_color$git_branch${NO_COLOR}]"
}

set_color_prompt () {
    case "$HOSTNAME" in
        Limones*|celso*) HIGHLIGHT_COLOR="${GREEN}" ;;
        *) HIGHLIGHT_COLOR="${RED}" ;;
    esac

    PROMPT_DISPLAY="${HIGHLIGHT_COLOR}\u@\h${NO_COLOR}:${BLUE}\w${NO_COLOR}"

    # If this is an xterm set the title to user@host:dir
    case "$TERM" in
    xterm*|rxvt*)
        PROMPT_COMMAND='PS1="\[\e]0;\u@\h: \w\a\]${PROMPT_DISPLAY}$(git_prompt)\$ "'
        ;;
    *)
        PROMPT_COMMAND='PS1="${PROMPT_DISPLAY}$(git_prompt)\$ "'
        ;;
    esac
}

# Set default editor to vim
export EDITOR=vim

# Set locale
unset LC_CTYPE
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
#export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
# ... or force ignoredups and ignorespace
export HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

if [ `which lesspipe.sh` ]; then eval `lesspipe.sh`; fi

set_color_prompt

# Alias definitions are in ~/.bash_aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable color support of ls
if [ -x /usr/bin/dircolors ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
else
    alias ls='ls -G'
fi

# Check if homebrew is installed (package system for Mac OS X)
if [ `which brew` ]; then
  BREW_PREFIX=`brew --prefix`
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f ${BREW_PREFIX}/etc/bash_completion ]; then
    . ${BREW_PREFIX}/etc/bash_completion
fi

export NODE_PATH=/usr/local/lib/node:/usr/local/lib/node_modules:$NODE_PATH

# Clean color settings
