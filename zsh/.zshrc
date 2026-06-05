export FPATH="$HOME/.zsh/completions:$FPATH"
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="sonicradish"
plugins=(git z zsh-autosuggestions zsh-syntax-highlighting)

FPATH="/opt/homebrew/share/zsh/site-functions:${FPATH}"
fpath=($HOME/.docker/completions $fpath)

# Cache compinit: run full audit at most once/day, otherwise -C. Shadow
# compinit during oh-my-zsh source so its internal call is a no-op.
ZSH_DISABLE_COMPFIX=true
autoload -Uz compinit
_zcompdump="${ZSH_COMPDUMP:-$HOME/.zcompdump}"
if [[ -n $_zcompdump(#qNmh-24) ]]; then
  compinit -C -d "$_zcompdump"
else
  compinit -d "$_zcompdump"
fi
compinit() { :; }
source $ZSH/oh-my-zsh.sh
unfunction compinit
autoload -Uz compinit
unset _zcompdump

export PATH="/opt/homebrew/opt/node@20/bin:$PATH"
export PATH="$PATH:$HOME/go/bin"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

. "$HOME/.local/bin/env"
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"
. "$HOME/.deno/env"

alias tm='tmux new -A -s main'
