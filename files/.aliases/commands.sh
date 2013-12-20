alias ea="vim ~/.dot-files/files/.aliases/commands.sh && source ~/.dot-files/files/.aliases/commands.sh"
alias eb="vim ~/.dot-files/files/.bashrc && source ~/.dot-files/files/.bashrc"
alias ..="cd .."
alias cp="cp -i"
alias ack='ack-grep'

alias crontab="VIM_CRONTAB=true EDITOR=vim crontab"

# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ]; then
    # dircolors doesn't exist on mac osx
    if [ `which dircolors` ]; then eval "`dircolors -b`"; fi
    if [ `uname -s` == 'Linux' ]; then
        alias ls='ls --color=auto'
    else
        alias ls='ls -G'
    fi

    alias ll='ls -l'
    alias l='ls -CF'

    export GREP_OPTIONS='--color=auto'
fi

alias vi='vim'

alias b="./build.sh"
alias sci="svn ci"
alias sup="svn up"
alias sst="svn st"
alias ss="svn st"
alias sd="svn diff | less"


RUBY_NUMERIC_ARRAY_STR='ruby -e "load \"~/.dot-files/stats.rb\"; p ARGF.select{|e| e =~ /^\s*[+-]?\d+[.]?\d*/ }.map { |e| e.to_f }'
alias min='ruby -e "p ARGF.select{|e| e =~ /^\s*[+-]?\d+[.]?\d*/ }.map{|e| e.to_f }.min"'
alias max='ruby -e "p ARGF.select{|e| e =~ /^\s*[+-]?\d+[.]?\d*/ }.map{|e| e.to_f }.max"'
alias sum='ruby -e "p ARGF.select{|e| e =~ /^\s*[+-]?\d+[.]?\d*/ }.map{|e| e.to_f }.inject(0.0) {|a,x| a+=x}"'
alias mean='ruby -e "tmp = ARGF.select{|e| e =~ /^\s*[+-]?\d+[.]?\d*/ }.map{|e| e.to_f }; p tmp.inject(0.0) {|a,x| a+=x} / tmp.size"'
alias var="${RUBY_NUMERIC_ARRAY_STR}.sum\""

export LESS="-R"

alias screen='byobu'
