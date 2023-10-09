
if [[ -e /proc/version ]]; then
  if [[ $(grep microsoft /proc/version) ]]; then
    unset DISPLAY
  fi
fi

if [[ $(command -v nvim) ]]; then
  export EDITOR=nvim
  export VISUAL=nvim
elif [[ $(command -v vim) ]]; then
  export EDITOR=vim
  export VISUAL=vim
else
  export EDITOR=vi
  export VISUAL=vi
fi

source "$HOME/.antigen/antigen.zsh"

antigen use oh-my-zsh

antigen bundle fzf
antigen bundle zsh-interactive-cd
antigen bundle command-not-found

antigen apply

alias ls="exa -lgh"
alias lzg="lazygit --use-config-file="$HOME/.config/lazygit/config.yml,$HOME/.config/lazygit/themes/mocha/rosewater.yml""
alias dc="docker compose"
alias dcu="docker compose up"
alias dce="docker compose exec"
alias dcb="docker compose build --ssh default=$HOME/.ssh/id_rsa"
alias dcd="docker compose down"
alias dcr="docker compose run"
alias dctest="docker compose run test pytest"


export DOCKER_BUILDKIT=1
export COMPOSE_DOCKER_CLI_BUILD=1

export svenv() {
  source "$HOME/.venvs/$1/bin/activate"
}

try_add_to_path() {
	dir=$1
	if [[ -d $dir ]]; then
		export PATH="$dir:$PATH"
	fi
}
try_add_to_path "$HOME/.local/share/fnm"
try_add_to_path "$HOME/.cargo/bin"
try_add_to_path "$HOME/go/bin"
try_add_to_path "$HOME/.local/bin"

if [[ ! -d "$HOME/.npm-global" ]]; then
  mkdir "$HOME/.npm-global"
  npm config set prefix "$HOME/.npm-global"
  export PATH="$HOME/.npm-global/bin:$PATH"
fi


if [[ $(command -v starship) ]]; then
	eval "$(starship init zsh)"
fi

if [[ -d "$HOME/.local/share/fnm" ]]; then
	eval "$(fnm env)"
fi

if [[ $(uname -a | grep Darwin) ]]; then
  export GPG_TTY=$TTY
  export SSH_AUTH_SOCK=/Users/alexp/Library/Containers/com.maxgoedjen.Secretive.SecretAgent/Data/socket.ssh
fi

source "$HOME/.profile"
