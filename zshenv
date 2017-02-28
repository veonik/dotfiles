# Sourced on all invocations
# Should not produce output or assume a tty is present
export PYENV_ROOT="${HOME}/.pyenv"
export RBENV_ROOT="${HOME}/.rbenv"
export PATH="${PYENV_ROOT}/shims:${PYENV_ROOT}/bin:${RBENV_ROOT}/bin:${PATH}"
eval "$(pyenv init -)"
eval "$(rbenv init -)"

# Machine-specific configuration
source ~/.machine

# Java configuration
export JAVA_HOME=`/usr/libexec/java_home`

# Macports
export PATH="/opt/local/bin:${PATH}"

# Go configuration
export GOPATH=$HOME/go
export GOROOT=/usr/local/go
export GOBIN=$GOPATH/bin

launchctl setenv GOROOT $GOROOT
launchctl setenv GOPATH $GOPATH

export PATH="${GOROOT}/bin:${GOPATH}/bin:${PATH}"

# Postgres.app

export PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:${PATH}"

# User bin

export PATH="${HOME}/bin:/usr/local/bin:${PATH}"

# GNU coreutils
export PATH="/opt/local/libexec/gnubin/:${PATH}"

# Hadoop related
export PATH="${PATH}:/usr/local/hadoop/bin:/usr/local/hive/bin:/usr/local/spark/bin:/usr/local/sbt/bin"
