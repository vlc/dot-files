# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups
# ... and ignore same sucessive entries.
export HISTCONTROL=ignoreboth

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
# case "$TERM" in
#xterm-color)
#    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
#    ;;
#*)
#    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
#    ;;
#esac

# Comment in the above and uncomment this below for a color prompt
GREY="\[\033[01;30m\]"
GREEN="\[\033[01;32m\]"
YELLOW="\[\033[01;33m\]"
#BLUE="\[\033[01;33m\]"
BLUE="\[\033[01;34m\]"
WHITE="\[\033[00m\]"
WHITE="\[\033[01;37m\]"
export GREY BLUE GREEN HUH HUH2
case "$USER" in 
root)
  PS1='${debian_chroot:+($debian_chroot)}\[\033[01;101m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
  ;;
*)
  #PS1='\$(date)${debian_chroot:+($debian_chroot)}\[\033[01;31m\]\$(date +%Y%m%d\ %H:%M:%S)\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
  PS1="${debian_chroot:+($debian_chroot)}${GREY}\$(date +%Y%m%d\ %H:%M:%S) ${BLUE}\u@\h${WHITE}:${GREEN}\w${WHITE}${GREY}\$(__git_ps1)${WHITE} "
  ;;
esac

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
    ;;
*)
    ;;
esac

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
    #alias dir='ls --color=auto --format=vertical'
    #alias vdir='ls --color=auto --format=long'
    export GREP_OPTIONS='--color=auto'
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

JAVA_HOME=/opt/jdk16
EDITOR=vim
FIGNORE="CVS:.swp:.svn"
PATH=$JAVA_HOME/bin:/var/lib/gems/1.8/bin/:$PATH:~/bin
AWT_TOOLKIT=MToolkit

export JAVA_HOME EDITOR FIGNORE PATH AWT_TOOLKIT

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.

# Amazon EC2 stuff
if [ -f ~/.ec2rc ]; then
  . ~/.ec2rc
fi
if [ -f ~/Projects/kahuna/etc/ec2/ec2rc ]; then
  . ~/Projects/kahuna/etc/ec2/ec2rc
fi

# Oracle stuff
if [ -d /opt/oracle/instantclient_10_2 ]; then
  LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/oracle/instantclient_10_2
  ORACLE_HOME=/opt/oracle/instantclient_10_2
fi

# Setup the LANG so that gcc doesn't spit a^ characters instead of '
LANG=en_AU.utf8

export LD_LIBRARY_PATH
export LANG
export ORACLE_HOME
