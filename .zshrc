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
export ACK_PAGER_COLOR="less"

# Base16 Shell
# git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
BASE16_SCHEME="tomorrow"
BASE16_SHELL="$HOME/.config/base16-shell/base16-$BASE16_SCHEME.dark.sh"
[[ -s $BASE16_SHELL ]] && . $BASE16_SHELL

# Golang
export GOPATH=$HOME/go
export GOROOT=/usr/local/go
[ -d /usr/local/opt/go ] && export GOROOT=/usr/local/opt/go/libexec  # Homebrew
export PATH=$GOROOT/bin:$GOPATH/bin:/usr/local/bin:$PATH
export GO15VENDOREXPERIMENT=1

# On Ubuntu ack is called ack-grep.
[ -x /usr/bin/ack-grep ] && alias ack=ack-grep

# Virtual Box
function startvm() { VBoxManage startvm $1 --type headless; }
function stopvm() { VBoxManage controlvm "$1" poweroff; }
function pausevm() { VBoxManage controlvm "$1" savestate; }

# Remove clubber
set +C

alias gprune="git branch --merged | grep -v \"\*\" | grep -v master | grep -v dev | xargs -n 1 git branch -d"

# Source local settings.
if [[ -s "${ZDOTDIR:-$HOME}/.zsh.local" ]]; then
  source "${ZDOTDIR:-$HOME}/.zsh.local"
fi
