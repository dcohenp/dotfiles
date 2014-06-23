# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples.

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Utility functions to quickly modify PATH
# Based on http://stackoverflow.com/questions/370047/what-is-the-most-elegant-way-to-remove-a-path-from-the-path-variable-in-bash
path_append ()  { path_remove $1; export PATH="$PATH:$1"; }
path_prepend () { path_remove $1; export PATH="$1:$PATH"; }
path_remove ()  { export PATH=`echo -n $PATH | awk -v RS=: -v ORS=: '$0 != "'$1'"' | sed 's/:$//'`; }

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
    git_prompt_str=""
    if git rev-parse --git-dir > /dev/null 2>&1; then
        local git_branch=$(git branch 2>/dev/null| sed -n '/^\*/s/^\* //p')

        if git diff --quiet 2>/dev/null >&2; then
            local git_color="${GREEN}"
        else
            local git_color="${RED}"
        fi
        git_prompt_str="${BLUE}[${git_color}${git_branch}${BLUE}]"
    fi


    # Also add pwd
    echo "${git_prompt_str}$(cwd_prompt)"
}

cwd_prompt() {
    local dir="$PWD"
    # Substitute home by tilde
    if [[ "$HOME" == ${dir:0:${#HOME}} ]] ; then
        dir="~${dir:${#HOME}}"
    fi
    echo "${BOLD_BLUE}$dir"
}

# This variable holds the name of the function
# which generates the "current directory" part of the prompt
prompt_dir_generator=cwd_prompt
alias gitprompt="prompt_dir_generator=git_prompt"

set_prompt () {
    case "$HOSTNAME" in
        eizbook*|hplc*|cl01*) HIGHLIGHT_COLOR="${GREEN}" ;;
        *) HIGHLIGHT_COLOR="${RED}" ;;
    esac

    # If this is an xterm set the title to user@host:dir
    case "$TERM" in
    xterm*|rxvt*)
        local xterm_prompt="\[\e]0;\h: \w\a\]"
        ;;
    esac
    PROMPT_COMMAND="PS1=\"${xterm_prompt}${HIGHLIGHT_COLOR}\u@\h${NO_COLOR}:\$(\${prompt_dir_generator})${NO_COLOR}\$ \""
}

export EDITOR=vim
export LESS="-F -X -I -R"
export PAGER="less"
# Use my own readline .inputrc
export INPUTRC="${HOME}/.inputrc"

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

if [ `command -v lesspipe.sh 2> /dev/null` ]; then eval `lesspipe.sh`; fi

set_prompt

# Alias definitions are in ~/.bash_aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable color support of ls
if [ -x /usr/bin/dircolors ]; then
    if [ -r $HOME/.dircolors ]; then
        dircolorfile="$HOME/.dircolors"
    fi
    eval "`dircolors -b $dircolorfile`"
    alias ls='ls --color=auto -CF'
else
    alias ls='ls -CF'
fi

# Allow for an environment-specific bashrc
if [ -f ~/.bashrc.local ]; then
    . ~/.bashrc.local
fi

