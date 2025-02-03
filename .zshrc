plugins=(git zsh-autosuggestions zsh-syntax-highlighting web-search)

#═══════════════════════════════ Environment Variables ═══════════════════════════════#
# Set to superior editing mode
set -o vi
export VISUAL=nvim
export EDITOR=nvim
# export TERM="tmux-256color"
export BROWSER="edge"
# Directories
export REPOS="$HOME/Repos"
export GITUSER="gerardvandenberg"
export GHREPOS="$REPOS/github.com/$GITUSER"
export DOTFILES="$GHREPOS/dotfiles"
export LAB="$GHREPOS/lab"
export SCRIPTS="$DOTFILES/scripts"
export ICLOUD="$HOME/icloud"
export ZETTELKASTEN="$HOME/Zettelkasten"
# Aliases
alias ls='ls --color=auto'
alias lab='cd $LAB'
# Go related
export GOBIN="$HOME/.local/bin"
export GOPRIVATE="github.com/$GITUSER/*,gitlab.com/$GITUSER/*"
# export GOPATH="$HOME/.local/share/go"
export GOPATH="$HOME/go/"

#═══════════════════════════════════ History ════════════════════════════════════════#
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt HIST_IGNORE_SPACE  # Don't save when prefixed with space
setopt HIST_IGNORE_DUPS   # Don't save duplicate lines
setopt SHARE_HISTORY      # Share history between sessions

#═══════════════════════════════════ Prompt ════════════════════════════════════════#
PURE_GIT_PULL=0
if [[ "$OSTYPE" == darwin* ]]; then
  fpath+=("$(brew --prefix)/share/zsh/site-functions")
else
  fpath+=($HOME/.zsh/pure)
fi
autoload -U promptinit; promptinit
prompt pure

#═══════════════════════════════ Completion ═══════════════════════════════════#
fpath+=~/.zfunc
if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
fi
autoload -Uz compinit
compinit -u
zstyle ':completion:*' menu select

#═════════════════════════════ Path Configuration ═════════════════════════════#
setopt extended_glob null_glob
path=(
    $path                           # Keep existing PATH entries
    $HOME/bin
    $HOME/.local/bin                # Go
    $HOME/.cargo/env                # Rust
    $HOME/dotnet
    $SCRIPTS
    $HOME/.krew/bin
    $HOME/.rd/bin                   # Rancher Desktop
    /home/vscode/.local/bin         # Dev Container Specifics
    /root/.local/bin                # Dev Container Specifics
)
# Remove duplicate entries and non-existent directories
typeset -U path
path=($^path(N-/))
export PATH

#═════════════════════════════════ Miscellaneous ════════════════════════════════#
# fzf - zsh
eval "$(fzf --zsh)"
# starship
#eval "$(starship init zsh)"
# direnv
eval "$(direnv hook zsh)"
### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/gerard/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
