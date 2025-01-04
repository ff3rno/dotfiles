# zmodload zsh/zprof

source $HOME/antigen.zsh

# antigen use oh-my-zsh

zstyle ':omz:plugins:eza' 'dirs-first' yes
zstyle ':omz:plugins:eza' 'git-status' yes
zstyle ':omz:plugins:eza' 'header' yes
zstyle ':omz:plugins:eza' 'icons' yes
zstyle ':omz:plugins:eza' 'hyperlink' yes

antigen bundle git
antigen bundle pip
antigen bundle command-not-found
antigen bundle aliases
antigen bundle autojump
antigen bundle aws
antigen bundle bgnotify
antigen bundle brew
antigen bundle colored-man-pages
antigen bundle common-aliases
antigen bundle copyfile
antigen bundle copypath
antigen bundle eza
antigen bundle extract
antigen bundle fzf
antigen bundle git-auto-fetch
antigen bundle history
antigen bundle hstr
antigen bundle magic-enter
antigen bundle rvm
antigen bundle nvm
antigen bundle pip
antigen bundle pyenv
antigen bundle dnf
antigen bundle tmux

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle kennethreitz/autoenv
# antigen bundle manlao/zsh-auto-nvm
# antigen bundle z-shell/zsh-diff-so-fancy

antigen theme half-life

antigen apply

setopt promptsubst

# zsh-history-substring-search configuration
bindkey '^[[A' history-substring-search-up # or '\eOA'
bindkey '^[[B' history-substring-search-down # or '\eOB'
HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE=1

# HSTR configuration
alias hh=hstr
setopt histignorespace
export HSTR_CONFIG=hicolor,keywords,prompt-bottom,hide-help,case-sensitive
bindkey -s "\C-r" "\C-a hstr -- \C-j"
export HSTR_TIOCSTI=y

trusted_owners=("xia-null")

gc() {
  local trusted_owners=("xia-null")

  if [[ $# -ne 1 || $1 != */* ]]; then
    echo "Usage: gc <owner/repo>"
    return 1
  fi

  local owner="${1%%/*}"
  local repo="${1##*/}"

  local dest="$HOME/.src/github/$owner/$repo"

  local url
  if [[ " ${trusted_owners[@]} " =~ " $owner " ]]; then
    url="ssh@github.com:$owner/$repo.git"
  else
    url="https://github.com/$owner/$repo.git"
  fi

  if [[ -e "$dest" && -n $(ls -A "$dest" 2>/dev/null) ]]; then
    echo "Error: Destination '$dest' is not empty."
    return 1
  fi

  mkdir -p "$dest" || {
    echo "Error: Could not create directory '$dest'."
    return 1
  }

  if [[ " ${trusted_owners[@]} " =~ " $owner " ]]; then
    git clone "$url" "$dest" || {
      echo "Error: Failed to clone repository via SSH."
      return 1
    }
  else
    git clone --depth=1 "$url" "$dest" || {
      echo "Error: Failed to clone repository via HTTPS."
      return 1
    }
  fi

  echo "Repository '$owner/$repo' cloned successfully to '$dest'."
}

# aliases

alias jql="jq '. | length'"

function getapk() {
    all_args=( "$@" )
    /Users/c.mihalache/.src/github/blues-lab/getapk/get-apk.sh "${all_args[@]}"
}

export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

# zprof
