. ~/.aliases

# Custom path additions
export PATH=~/.local/scripts:$PATH

function settitle() {
	echo -n -e "\033]0;"$*"\007"
}

export PATH=~/Library/Python/3.9/bin:$PATH
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export CDPATH=~/projects
autoload -U compinit; compinit # make auto-complete available for CDPATH directories

# gvm
[[ -s "/Users/drew/.gvm/scripts/gvm" ]] && source "/Users/drew/.gvm/scripts/gvm"

# Add PG to PATH
export PATH=/opt/homebrew/opt/postgresql@15/bin:$PATH

# pnpm
export PNPM_HOME="/Users/drew/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# fzf config
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# zoxide config
eval "$(zoxide init --cmd cd zsh)"

