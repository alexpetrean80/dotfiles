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

antigen bundle brew
antigen bundle fzf
antigen bundle zsh-interactive-cd
antigen bundle command-not-found

antigen apply

alias ls="eza -lgh"

alias lzg="lazygit --use-config-file="$HOME/.config/lazygit/config.yml,$HOME/.config/lazygit/themes/mocha/rosewater.yml""

# docker compose aliases
alias dc="docker compose"
alias dcu="docker compose up"
alias dce="docker compose exec"
alias dcb="docker compose build"
alias dcd="docker compose down"
alias dcr="docker compose run"

export DOCKER_BUILDKIT=1
export COMPOSE_DOCKER_CLI_BUILD=1


# activate a python virtualenv from anywhere
export svv() {
  if [[ $(command -v fd) ]]; then
    venvs=$(fd -t d -g -H "bin" $HOME/.venvs | sed 's/\/bin//')
  else
    venvs=$(find $HOME/.venvs -type d -name "bin" -exec echo {} \;)
  fi

  venv=$(echo "$venvs" | fzf)
  source "$venv/bin/activate"
}


try_add_to_path() {
	dir=$1
	if [[ -d $dir ]]; then
		export PATH="$dir:$PATH"
	fi
}

export GOPATH="$HOME/go/"

try_add_to_path "$GOPATH"
try_add_to_path "$HOME/.local/share/npm/bin"
try_add_to_path "$HOME/.local/share/fnm"
try_add_to_path "$HOME/.cargo/bin"
try_add_to_path "$HOME/go/bin"
try_add_to_path "$HOME/.local/bin"
try_add_to_path "$HOME/.local/share/bob/nightly/nvim-linux64/bin/"
try_add_to_path "${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

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
  alias rm="/opt/homebrew/bin/grm"
  export TELEPORT_HOME="$HOME/.tsh"
fi


source "$HOME/.profile"

eval "$(fnm env --use-on-cd)"



# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/alexp/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/alexp/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/alexp/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/alexp/google-cloud-sdk/completion.zsh.inc'; fi

if [[ $(command -v direnv) ]]; then
 eval "$(direnv hook zsh)"
fi
