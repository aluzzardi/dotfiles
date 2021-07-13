# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Editor
alias vi="vim"
export EDITOR="vim"
if [ -x /usr/local/bin/mvim ]; then  # OSX
	export EDITOR="mvim -v"
	alias vim="$EDITOR"
fi
export VISUAL="$EDITOR"
export PAGER="less -R"
export ACK_PAGER_COLOR="$PAGER"
alias less="less -R"

# Browser
export BROWSER=firefox

# Base16 Shell
# git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

# Golang
export GOPATH=$HOME/go

# brew has higher priority than $PATH
export PATH=$HOME/.bin:$GOPATH/bin:/usr/local/bin:/usr/local/sbin:$PATH

# On Ubuntu ack is called ack-grep.
[ -x /usr/bin/ack-grep ] && alias ack=ack-grep

# Remove clubber
set +C

alias gprune="git branch --merged | grep -v \"\*\" | grep -v master | grep -v main | grep -v production | xargs -n 1 git branch -d"

alias brewski='brew update && brew upgrade && brew cleanup; brew doctor'

# Source local settings.
if [[ -s "${ZDOTDIR:-$HOME}/.zsh.local" ]]; then
  source "${ZDOTDIR:-$HOME}/.zsh.local"
fi

# Enable buildkit in compose
export DOCKER_BUILDKIT=1
export COMPOSE_DOCKER_CLI_BUILD=1

alias k=kubectl

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/usr/local/google-cloud-sdk/path.zsh.inc' ]; then . '/usr/local/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/usr/local/google-cloud-sdk/completion.zsh.inc' ]; then . '/usr/local/google-cloud-sdk/completion.zsh.inc'; fi
