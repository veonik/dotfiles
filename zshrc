# Sourced in interactive shells
source ~/.git-hubflow-completion.zsh
source ~/.git-flow-completion.zsh

# From bash
export VISUAL="mate2 -w"
export EDITOR="mate2 -w" # --line %d %s"
export SVN_EDITOR="mate2 -w"

export RUBYOPTS="rubygems"
export GOPATH=$HOME/go
# Stuff in my ~
export PATH="/opt/local/Library/Frameworks/Python.framework/Versions/3.3/bin:/opt/local/bin:/usr/local/pear/bin:${HOME}/.rbenv/bin:${HOME}/bin:$GOPATH/bin:${PATH}"

export LC_CTYPE="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"
export LANG="en_US.UTF-8"

# php53-fpm
alias fpm53_start='sudo launchctl load /Library/LaunchDaemons/org.macports.php53-fpm.plist'
alias fpm53_stop='sudo launchctl unload /Library/LaunchDaemons/org.macports.php53-fpm.plist'
alias fpm53_restart='fpm53_stop; fpm53_start'

# php54-fpm
alias fpm54_start='sudo launchctl load /Library/LaunchDaemons/org.macports.php54-fpm.plist'
alias fpm54_stop='sudo launchctl unload /Library/LaunchDaemons/org.macports.php54-fpm.plist'
alias fpm54_restart='fpm54_stop; fpm54_start'

# php55-fpm
alias fpm55_start='sudo launchctl load /Library/LaunchDaemons/org.macports.php55-fpm.plist'
alias fpm55_stop='sudo launchctl unload /Library/LaunchDaemons/org.macports.php55-fpm.plist'
alias fpm55_restart='fpm55_stop; fpm55_start'

alias mongostart="sudo mongod -f /opt/local/etc/mongodb/mongod.conf"

mongostop_func () {
      local mongopid=`less /opt/local/var/db/mongodb_data/mongod.lock`;
        if [[ $mongopid =~ [[:digit:]] ]]; then
                  sudo kill -15 $mongopid;
                        echo mongod process $mongopid terminated;
                          else
                                    echo mongo process $mongopid not exist;
                                      fi
                                  }

                                  alias mongostop="mongostop_func"

# postgres
alias pg_start='sudo launchctl load -w /Library/LaunchDaemons/org.macports.postgresql91-server.plist'
alias pg_stop='sudo launchctl unload /Library/LaunchDaemons/org.macports.postgresql91-server.plist'

# nginx
alias nginx_start='sudo launchctl load -w /Library/LaunchDaemons/org.macports.nginx.plist'
alias nginx_stop='sudo launchctl unload -w /Library/LaunchDaemons/org.macports.nginx.plist'
alias nginx_restart='nginx_stop; nginx_start;'

# redis
alias redis_start='sudo launchctl load /Library/LaunchDaemons/org.macports.redis.plist'
alias redis_stop='sudo launchctl unload /Library/LaunchDaemons/org.macports.redis.plist'
alias redis_restart='redis_stop; redis_start'

alias fuck='$(thefuck $(fc -ln -1))'

alias fix_localhost='sudo apachectl restart; fpm55_restart;'
alias myip='dig +short myip.opendns.com @resolver1.opendns.com'

alias sf2init='rm -rf app/cache/* app/logs/*; sudo chmod +a "_www allow delete,write,append,file_inherit,directory_inherit" app/cache app/logs; sudo chmod +a "`whoami` allow delete,write,append,file_inherit,directory_inherit" app/cache app/logs'

hidden() {
  if [ "$(defaults read com.apple.finder AppleShowAllFiles)" = 0 ]
      then 
        defaults write com.apple.finder AppleShowAllFiles 1
        echo "Showing all hidden files."
      else 
        defaults write com.apple.finder AppleShowAllFiles 0
        echo "Hiding all hidden files."
  fi
  killall Finder
}

export GOROOT="/opt/local/go"
export GOPATH="/Users/Tyler/go"
launchctl setenv GOROOT $GOROOT
launchctl setenv GOPATH $GOPATH

## keybindings (run 'bindkeys' for details, more details via man zshzle)
# use emacs style per default:
bindkey -e

# use vi style:
# bindkey -v

# Enable Ctrl-x-e to edit command line
autoload -U edit-command-line
# Emacs style
zle -N edit-command-line
bindkey '^xe' edit-command-line
bindkey '^x^e' edit-command-line

# Vi style:
# zle -N edit-command-line
# bindkey -M vicmd v edit-command-line

autoload -U zmv

autoload -U history-search-end

#########################################################################################
## Completions

fpath=(~/.zsh/functions $fpath)
typeset -U fpath

autoload -U compinit
compinit

## completions ####
autoload -U zstyle+

## General completion technique
## complete as much as you can ..
zstyle ':completion:*' completer _complete _list _oldlist _expand _ignored _match _correct _approximate _prefix
## complete less
#zstyle ':completion:*' completer _expand _complete _list _ignored _approximate
## complete minimal
#zstyle ':completion:*' completer _complete _ignored

## determine in which order the names (files) should be
## listed and completed when using menu completion.
## `size' to sort them by the size of the file
## `links' to sort them by the number of links to the file
## `modification' or `time' or `date' to sort them by the last modification time
## `access' to sort them by the last access time
## `inode' or `change' to sort them by the last inode change time
## `reverse' to sort in decreasing order
## If the style is set to any other value, or is unset, files will be
## sorted alphabetically by name.
zstyle ':completion:*' file-sort name

## case-insensitive (uppercase from lowercase) completion
#zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
## case-insensitive (all) completion
#zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
## case-insensitive,partial-word and then substring completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

## completion caching
zstyle ':completion:*' use-cache 1
# zstyle ':completion:*' cache-path ~/.zcompcache/$HOST

## add colors to completions
zstyle ':completion:*' list-colors ${(s.:.)LSCOLORS}

### If you want zsh's completion to pick up new commands in $path automatically
### comment out the next line and un-comment the following 5 lines
zstyle ':completion:::::' completer _complete _approximate
#_force_rehash() {
#  (( CURRENT == 1 )) && rehash
#  return 1# Because we didn't really complete anything
#}
#zstyle ':completion:::::' completer _force_rehash _complete _approximate
zstyle -e ':completion:*:approximate:*' max-errors 'reply=( $(( ($#PREFIX + $#SUFFIX) / 3 )) )'
zstyle ':completion:*:descriptions' format "- %d -"
zstyle ':completion:*:corrections' format "- %d - (errors %e})"
zstyle ':completion:*:default' list-prompt '%S%M matches%s'
zstyle ':completion:*' group-name ''
zstyle ':completion:*:manuals' separate-sections true
zstyle ':completion:*:manuals.(^1*)' insert-sections true
zstyle ':completion:*' menu select
zstyle ':completion:*' verbose yes

zstyle ':completion:*:kill:*:processes' command "ps x"

# Auto-completion for ssh hosts
zstyle -e ':completion::*:hosts' hosts 'reply=($(sed -e "/^#/d" -e "s/ .*\$//" -e "s/,/ /g" /etc/ssh_known_hosts(N) ~/.ssh/known_hosts(N) 2>/dev/null | xargs) $(grep \^Host ~/.ssh/config(N) | cut -f2 -d\  2>/dev/null | xargs))'

#########################################################################################
# Colors

autoload -U colors; colors;

setopt prompt_subst
# Combined left and right prompt configuration.
local smiley="%(?,%F{green}☺%f,%F{red}☹%f)"

PROMPT='%F{blue}:: %F{white}%3~ ${smiley} %F{blue}%(0!.#.») %b%f'
RPROMPT='%F{white} $(rbenv version-name) $(~/bin/git-cwd-info.rb)%f'

# TODO LSCOLORS and LS_COLORS don't define the same color scheme
export LSCOLORS=gxfxcxdxbxegedabagacad
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

#########################################################################################
# Some options

# history:
setopt append_history       # append history list to the history file (important for multiple parallel zsh sessions!)
setopt SHARE_HISTORY        # import new commands from the history file also in other zsh-session
setopt extended_history     # save each command's beginning timestamp and the duration to the history file
setopt hist_ignore_all_dups # If  a  new  command  line being added to the history
                            # list duplicates an older one, the older command is removed from the list
setopt hist_ignore_space    # remove command lines from the history list when
                            # the first character on the line is a space

HISTFILE=$HOME/.zsh_history
HISTSIZE=2000
SAVEHIST=3000              # useful for setopt append_history


setopt auto_cd              # if a command is issued that can't be executed as a normal command,
                            # and the command is the name of a directory, perform the cd command to that directory
setopt rmstarsilent
setopt extended_glob        # in order to use #, ~ and ^ for filename generation
                            # grep word *~(*.gz|*.bz|*.bz2|*.zip|*.Z) ->
                            # -> searches for word not in compressed files
                            # don't forget to quote '^', '~' and '#'!

setopt longlistjobs         # display PID when suspending processes as well

setopt notify               # report the status of backgrounds jobs immediately

setopt hash_list_all        # Whenever a command completion is attempted, make sure
                            # the entire command path is hashed first.

# setopt completeinword       # not just at the end

setopt nohup                # and don't kill them, either

# setopt auto_pushd         # make cd push the old directory onto the directory stack.

setopt nonomatch            # try to avoid the 'zsh: no matches found...'

setopt nobeep               # avoid "beep"ing

setopt pushd_ignore_dups    # don't push the same dir twice.

setopt noglobdots           # * shouldn't match dotfiles. ever.

setopt long_list_jobs       # List jobs in long format
setopt PRINT_EXIT_VALUE

#########################################################################################

# do we have GNU ls with color-support?
alias ls='ls -bh -CF'
alias la='ls -lhAF'
alias ll='ls -lh'
alias lh='ls -hAl'
alias l='ls -lhF'

alias '..'='cd ..'
# The -g makes them global aliases, so they're expaned even inside commands
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
# Aliases '-' to 'cd -'
alias -- -='cd -'

alias cp='nocorrect cp'         # no spelling correction on cp
alias mkdir='nocorrect mkdir'   # no spelling correction on mkdir
alias mv='nocorrect mv'         # no spelling correction on mv
alias rm='nocorrect rm'         # no spelling correction on rm

# Execute rmdir
alias rd='rmdir'
# Execute rmdir
alias md='mkdir -p'

# general
# Execute du -sch
alias da='du -sch'
# Execute jobs -l
alias j='jobs -l'

# chmod
alias rw-='chmod 600'
alias rwx='chmod 700'
alias r--='chmod 644'
alias r-x='chmod 755'

#########################################################################################
# Custom aliases/commands

# Convert a picture to a favicon
alias make-favicon="convert -colors 256 -resize 16x16 "

# Copy the working dir to the clipboard
alias cpwd='pwd|xargs echo -n|pbcopy'

# Show current airport status:
alias apinfo='/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport -I'

alias httpdump='sudo tcpdump -i en0 -n -s 0 -w - | grep -a -o -E "Host\: .*|GET \/.*"'

# mkdir, cd into it (via http://onethingwell.org/post/586977440/mkcd-improved)
function mkcd () {
    mkdir -p "$*"
    cd "$*"
}

function shareacl () {
    rootDir="app"
    if [ "$1" != "" ]; then
        rootDir="$1"
    fi
    
    shareWith="_www"
    if [ "$2" != "" ]; then
        shareWith="$2"
    fi

    rm -rf "$rootDir/cache/*" "$rootDir/logs/*" "$rootDir/files/*"
    sudo chmod +a "$shareWith allow delete,write,append,file_inherit,directory_inherit" "$rootDir/cache" "$rootDir/logs" "$rootDir/files"
    sudo chmod +a "`whoami` allow delete,write,append,file_inherit,directory_inherit" "$rootDir/cache" "$rootDir/logs" "$rootDir/files"
}

function ydl () {
    for url ($*) /usr/bin/python /usr/local/bin/youtube-dl --continue --literal --console-title --format 22 "$url" || /usr/bin/python /usr/local/bin/youtube-dl --continue --literal --console-title "$url"
}

# If bcat (Browser cat, http://rtomayko.github.com/bcat/) is invoked as `btee', it acts like `tee(1)'
alias btee=bcat

# sh function to murder all running processes matching a pattern
# thanks 3n: http://twitter.com/3n/status/19113206105
function murder () {
  ps | grep $1 | grep -v grep | awk '{print $1}' | xargs kill -9
}

alias dotedit="$VISUAL ~/dotfiles/"

alias sha1='openssl dgst -sha1'
alias sha256='openssl dgst -sha256'

alias wk2png='/usr/bin/python $(which webkit2png)'

function console {
  if [[ $# > 0 ]]; then
    query=$(echo "$*" | tr -s ' ' '|')
    tail -f /var/log/system.log|grep -i --color=auto -E "$query"
  else
    tail -f /var/log/system.log
  fi
}

#########################################################################################
# Editor aliases

alias e="${EDITOR}"
alias e.="${EDITOR} ."

alias m='mate'
alias m.='mate .'

alias v='mvim'
alias v.='mvim .'

#########################################################################################
# Ruby aliases/functions

# For Rails:
alias sc='./script/console'
alias sg='./script/generate'
alias ss='./script/server'
alias sd='./script/destroy'

alias pryr="pry -r ./config/environment -r rails/console/app -r rails/console/helpers"

function heftiest {
    for file in $(find app/$1/**/*.rb -type f); do wc -l $file ; done  | sort -r | head
}

# Rubinius

function rbx () {
    if [[ -x $(which -s rbx) ]]
    then
        command rbx "$@"
    else
        ${HOME}/Development/Rubinius/bin/rbx "$@"
    fi
}

alias weebuild='rake build && ./bin/mspec'

#########################################################################################
# Git aliases/functions

alias g='git'

#########################################################################################
# Grep stuff

# Grep in history
function greph () { history 0 | grep -i $1 }

# use colors when GNU grep with color-support
#  Execute grep --color=auto
alias grep='grep --color=auto'

#########################################################################################
## Functions for displaying neat stuff in *term title

# format titles for screen and rxvt
function title () {
    # escape '%' chars in $1, make nonprintables visible
    a=${(V)1//\%/\%\%}

    # Truncate command, and join lines.
    a=$(print -Pn "%40>...>$a" | tr -d "\n")

    case $TERM in
    screen)
    print -Pn "\ek$a:$3\e\\"      # screen title (in ^A")
    ;;
    xterm*|rxvt)
    print -Pn "\e]2;$2 | $a:$3\a" # plain xterm title
    ;;
    esac
}

# precmd is called just before the prompt is printed
function precmd () {
    title "zsh" "$USER@%m" "%55<...<%~"
}

# preexec is called just before any command line is executed
function preexec () {
    title "$1" "$USER@%m" "%35<...<%~"
}

# use .localrc for settings specific to one system
[[ -f ~/.localrc ]] && source ~/.localrc

# rbenv
eval "$(rbenv init -)"
builtin rehash
# pro cd function
pd() {
  projDir=$(pro search $1)
  cd ${projDir}
}

