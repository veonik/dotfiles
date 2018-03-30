# Sourced on all invocations
# Should not produce output or assume a tty is present
export PYENV_ROOT="${HOME}/.pyenv"
export RBENV_ROOT="${HOME}/.rbenv"
eval "$(${PYENV_ROOT}/bin/pyenv init -)"
eval "$(${RBENV_ROOT}/bin/rbenv init -)"

# Machine-specific configuration
source ~/.machine

# Java configuration
export JAVA_HOME=`/usr/libexec/java_home -v 1.8.0_111`

# Go configuration
export GOPATH=$HOME/go
export GOROOT=/usr/local/go
export GOBIN=$GOPATH/bin

launchctl setenv GOROOT $GOROOT
launchctl setenv GOPATH $GOPATH

export PATH="${GOROOT}/bin:${GOPATH}/bin:${PATH}"

# Postgres.app
export PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:${PATH}"

# Hadoop related
export PATH="${PATH}:/usr/local/hadoop/bin:/usr/local/hive/bin:/usr/local/spark/bin:/usr/local/sbt/bin"

# Kafka
export PATH="${PATH}:/usr/local/kafka/bin"

# Mongo
export PATH="${PATH}:/usr/local/mongodb/bin"

# Cabal/Stack
export PATH="${PATH}:${HOME}/.local/bin"
