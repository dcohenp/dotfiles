# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples.

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

set_color_prompt () {
  BOLD_RED="\[\e[01;31m\]"
  BOLD_GREEN="\[\e[01;32m\]"
  BOLD_BLUE="\[\e[01;34m\]"
  RED="\[\e[00;31m\]"
  GREEN="\[\e[00;32m\]"
  BLUE="\[\e[00;34m\]"
  NO_COLOR="\[\e[m\]"

  # set variable identifying the chroot you work in (used in the prompt below)
  if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
      debian_chroot=$(cat /etc/debian_chroot)
  fi

  # set a fancy prompt (non-color, unless we know we "want" color)
  case "$TERM" in
    xterm-color|xterm-256color) color_prompt=yes;;
  esac

  # uncomment for a colored prompt, if the terminal has the capability; turned
  # off by default to not distract the user: the focus in a terminal window
  # should be on the output of commands, not on the prompt
  #force_color_prompt=yes

  if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
      # We have color support; assume it's compliant with Ecma-48
      # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
      # a case would tend to support setf rather than setaf.)
      color_prompt=yes
    else
      color_prompt=
    fi
  fi

  if [ "$color_prompt" = yes ]; then
    case "$HOSTNAME" in
    limones*|celso*) HIGHLIGHT_COLOR="${GREEN}" ;;
    *) HIGHLIGHT_COLOR="${RED}" ;;
    esac
    PS1="${debian_chroot:+($debian_chroot)}${HIGHLIGHT_COLOR}\u@\h${NO_COLOR}:${BLUE}\w${NO_COLOR}\$ "
  else
    PS1="${debian_chroot:+($debian_chroot)}\u@\h:\w\$ "
  fi

}

# Set default editor to vim
export EDITOR=vim

# Set locale
unset LC_CTYPE
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
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

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# Alias definitions are in ~/.bash_aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
else
    alias ls='ls -G'
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ `which brew` ]; then
  if [ -f `brew --prefix`/etc/bash_completion ]; then
      . `brew --prefix`/etc/bash_completion
  fi
fi

export NODE_PATH=/usr/local/lib/node:/usr/local/lib/node_modules:$NODE_PATH


