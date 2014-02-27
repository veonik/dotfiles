# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]]; then
	# Shell is non-interactive.  Be done now
	return
fi

# Shell is interactive.  It is okay to produce output at this point,
# though this example doesn't produce any.  Do setup for
# command-line interactivity.

export LSCOLORS=gxfxcxdxbxegedabagacad

# Turn on compression for ssh
#alias ssh="ssh -C"

# Required for unicode screen
alias screen="screen -U"

# ls aliases
alias ls="ls -hG"
alias l="ls -lhG"
alias la="ls -lahG"

# SSH Key generator alias
alias mksshkey="ssh-keygen -b 8192 -t rsa -C '$1' -f ~/.ssh/$1.rsa"

alias g='git'

if [ -f /opt/local/etc/bash_completion ]; then
    . /opt/local/etc/bash_completion
fi

export PS1="\[\e[32;1m\]\u\[\e[0m\]\[\e[32m\]@\h \[\e[36m\]\w \[\e[33m\]\$ \[\e[0m\]"

# Some fancy history stuff
export HISTCONTROL=erasedups # No duplicates
export HISTSIZE=10000 # Bigger history
#shopt -s histappend # Append to ~/.bash_history
alias h='history | grep' # Easy history grep

# Change the window title of X terminals 
case $TERM in
        xterm*|rxvt|Eterm|eterm)
                PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}\007"'
                ;;
        screen)
                PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}\033\\"'
                ;;
esac
# pro cd function
pd() {
  projDir=$(pro search $1)
  cd ${projDir}
}
