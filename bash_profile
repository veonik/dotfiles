# Set favourite editor
export VISUAL="mate -w"
export EDITOR="mate -w" # --line %d %s"
export SVN_EDITOR="mate -w"

export RUBYOPTS="rubygems"

# Stuff in my ~
export PATH="/opt/local/bin:/usr/local/pear/bin:${HOME}/.rbenv/bin:${HOME}/bin:${PATH}"

export PATH="${PATH}:/usr/local/kafka/bin"

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


# postgres
alias pg_start='sudo launchctl load -w /Library/LaunchDaemons/org.macports.postgresql91-server.plist'
alias pg_stop='sudo launchctl unload /Library/LaunchDaemons/org.macports.postgresql91-server.plist'

# redis
alias redis_start='sudo launchctl load /Library/LaunchDaemons/org.macports.redis.plist'
alias redis_stop='sudo launchctl unload /Library/LaunchDaemons/org.macports.redis.plist'
alias redis_restart='redis_stop; redis_start'

alias sf2init='rm -rf app/files/* app/cache/* app/logs/*; sudo chmod +a "_www allow delete,write,append,file_inherit,directory_inherit" app/files app/cache app/logs; sudo chmod +a "`whoami` allow delete,write,append,file_inherit,directory_inherit" app/files app/cache app/logs'

[ -f ~/.bashrc ]    && . ~/.bashrc

# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH

export PATH="$HOME/.cargo/bin:$PATH"

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
[ -d "$HOME/.rvm/bin" ] && export PATH="$PATH:$HOME/.rvm/bin"
