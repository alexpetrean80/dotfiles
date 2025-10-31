source "$HOME/.zprofile"

export GOPATH="$HOME/go/"
export PATH="$GOPATH:$HOME/.local/share/npm/bin:$HOME/.local/share/fnm:$HOME/.cargo/bin:$GOPATH/bin:$HOME/.local/bin:$PATH"
export EDITOR="nvim"
export VISUAL="nvim"


source "$HOME/.antidote/antidote.zsh"

antidote load "$HOME/.zsh_plugins.txt"

alias lzg="lazygit"
alias ls="eza -lgh --icons"
alias lt="eza --tree --level=2 --long --icons --git"
alias dc="docker compose"

eval "$(fnm env --use-on-cd)"

eval "$(starship init zsh)"
