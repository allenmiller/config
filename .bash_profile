PROXY="http://webproxysea.nordstrom.net:8181"
NOPROXY="10.0.0.0/8,172.16.0.0/16,192.168.0.0.0/16,.nordstrom.net,*.local,nordstrom.net"
export AWS_DEFAULT_PROFILE=nordstrom-federated
export AWS_DEFAULT_REGION=us-west-2
export NORD_GIT_ROOT=~/git/src/git.nordstrom.net/nse/
proxyoff() {
  unset HTTPS_PROXY
  unset HTTP_PROXY
  unset FTP_PROXY
  unset RSYNC_PROXY
  unset http_proxy
  unset https_proxy
  unset ftp_proxy
  unset rsync_proxy
  unset no_proxy
  unset NO_PROXY
}

proxyon() {
  export HTTPS_PROXY=$PROXY
  export HTTP_PROXY=$PROXY
  export FTP_PROXY=$PROXY
  export RSYNC_PROXY=$PROXY
  export ftp_proxy=$PROXY
  export http_proxy=$PROXY
  export https_proxy=$PROXY
  export rsync_proxy=$PROXY
  export NO_PROXY=$NOPROXY
  export no_proxy=$NOPROXY
}

proxyoff
alias po=proxyon
alias px=proxyoff

alias cdnr="cd $NORD_GIT_ROOT"
alias "ll=ls -al"
alias "clean=rm -f *~ \#*# \.*~"

alias emacs="/usr/local/Cellar/emacs/25.1/Emacs.app/Contents/MacOS/Emacs -nw"
alias emacsw="/usr/local/Cellar/emacs/25.1/Emacs.app/Contents/MacOS/Emacs -bg black -fg wheat -fh"

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

GIT_COMPLETION=${HOME}/git/src/github.com/git/git/contrib/completion/git-completion.bash
if [ -f ${GIT_COMPLETION} ]; then
  . ${GIT_COMPLETION}
fi
