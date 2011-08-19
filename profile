# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.
#

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

PATH="/usr/local/bin:/usr/local/sbin:${PATH}"

if [ -d "/opt/subversion/bin" ] ; then
	PATH="/opt/subversion/bin:$PATH"
fi

if [ -d "/usr/local/mysql/bin" ] ; then
	PATH="/usr/local/mysql/bin:$PATH"
fi

if [ -d "/opt/jruby/bin" ] ; then
	PATH=$PATH:/opt/jruby/bin
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
	PATH="$HOME/bin:$PATH"
fi

# Homebrew Python install
if [ -d "/usr/local/share/python" ] ; then
	PATH="/usr/local/share/python:${PATH}"
fi

# PostgreSQL bin
if [ -d "/Library/PostgreSQL/9.0/bin/" ] ; then
	PATH="/Library/PostgreSQL/9.0/bin/:${PATH}"
fi

# adding Grails bin to the PATH"
if [ -d "/usr/local/grails" ] ; then
	export GRAILS_HOME=/usr/local/grails
	PATH="${PATH}:${GRAILS_HOME}/bin"
fi

export PATH
