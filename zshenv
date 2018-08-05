# Sourced on all invocations
# Should not produce output or assume a tty is present
[ -d "$HOME/.pyenv" ] && export PYENV_ROOT="${HOME}/.pyenv" && eval "$(${PYENV_ROOT}/bin/pyenv init -)"
[ -d "$HOME/.rbenv" ] && export RBENV_ROOT="${HOME}/.rbenv" && eval "$(${RBENV_ROOT}/bin/rbenv init -)"

# Machine-specific configuration
[ -f "~/.machine" ] && source ~/.machine

# Go configuration
export GOPATH=$HOME/go
export GOROOT=/usr/local/go
export GOBIN=$GOPATH/bin

export PATH="${GOROOT}/bin:${GOPATH}/bin:${PATH}"

# Darwin specific stuff
if [[ $(uname) == "Darwin" ]]; then
	# Java configuration
	export JAVA_HOME=`/usr/libexec/java_home -v 1.8.0_111`

	launchctl setenv GOROOT $GOROOT
	launchctl setenv GOPATH $GOPATH

	# Postgres.app
	export PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:${PATH}"
fi

# Hadoop related
[ -d "/usr/local/hadoop" ] && export PATH="${PATH}:/usr/local/hadoop/bin:/usr/local/hive/bin:/usr/local/spark/bin:/usr/local/sbt/bin"

# Kafka
[ -d "/usr/local/kafka" ] && export PATH="${PATH}:/usr/local/kafka/bin"

# Mongo
[ -d "/usr/local/mongodb" ] && export PATH="${PATH}:/usr/local/mongodb/bin"

# Cabal/Stack
[ -d "~/.local/bin" ] && export PATH="${PATH}:${HOME}/.local/bin"
