source "$HOME/.antigen/antigen.zsh"

antigen use oh-my-zsh

antigen bundle fzf
antigen bundle zsh-interactive-cd
antigen bundle command-not-found
antigen bundle zsh-users/zsh-syntax-highlighting

antigen apply

alias ls="exa -lgh"
alias lzg="lazygit"
alias dc="docker compose"
alias dcu="docker compose up"
alias dce="docker compose exec"
alias dcb="docker compose build --ssh default=$HOME/.ssh/id_rsa"
alias dcd="docker compose down"
alias dcr="docker compose run"
alias dctest="docker compose run test pytest"


export DOCKER_BUILDKIT=1
export COMPOSE_DOCKER_CLI_BUILD=1

try_add_to_path() {
	dir=$1
	if [[ -d $dir ]]; then
		export PATH="$dir:$PATH"
	else
		echo "$dir doesn't exist. skipping..."
	fi
}
try_add_to_path "$HOME/.local/share/fnm"
try_add_to_path "$HOME/.cargo/bin"
try_add_to_path "$HOME/.local/bin"

if [[ $(command -v starship) ]]; then
	eval "$(starship init zsh)"
fi

if [[ -d "$HOME/.local/share/fnm" ]]; then
	eval "$(fnm env)"
fi

# Turso
export PATH="/home/alexp/.turso:$PATH"
