if status is-interactive

    # {{{ aliases

    # {{{ general

    alias c="clear"
    alias x="exit"
    alias v="vim"
    alias j="z"
    alias nv="nvim"

    # }}}
    # {{{ git

    alias g="git"
    alias gs="git status"
    alias gl="git log"
    alias gcam="git commit -am"
    alias gcm="git commit -m"
    alias gcamnv="git commit --no-verify -am"
    alias gcmnv="git commit --no-verify -m"
    alias ga="git add"
    alias gasp="git add -p"
    alias gr="git restore"
    alias grs="git restore --staged"
    alias gres="git reset --soft"
    alias gre="git reset"
    alias gp="git push origin"
    alias gpf="git push --force origin"
    alias gpl="git pull origin"
    alias gf="git fetch origin"
    alias gst="git stash"
    alias gstp="git stash pop"
    alias gb="git branch"
    alias gbm="git branch -m"
    alias gco="git checkout"
    alias gcob="git checkout -b"
    alias gc="git clone"
    alias gt="git tag"
    alias grb="git rebase --no-ff"

    # }}}
    # {{{ pnpm

    alias pn="pnpm"
	alias pna="pnpm add"
    alias pnad="pnpm add -D"
	alias pnb="pnpm build"
	alias pnt="pnpm test"
	alias pns="pnpm start"
	alias pnl="pnpm lint"
	alias pnf="pnpm format"

    # }}}
    # {{{ brew

    alias b="brew"
    alias bi="brew install"
    alias bs="brew search"
    alias bu="brew update"
    alias bU="brew upgrade"
    alias br="brew uninstall"
    alias bl="brew list"

    # }}}
    # {{{ tmux

    alias tmn="tmux new -s"
    alias tma="tmux attach -t"
    alias tmk="tmux kill-session -t"
    alias tml="tmux list-sessions"

    # }}}
    # {{{ fisher

    alias fsr="fisher"
    alias fsri="fisher install"
    alias fsrl="fisher list"
    alias fsrr="fisher remove"

    # }}}

    # }}}
    # {{{ set *

    set -g fish_complete_path $fish_complete_path /opt/homebrew/share/fish/vendor_completions.d
    set -U fish_user_paths /opt/homebrew/bin/ $fish_user_paths
    set -x LANG en_US.UTF-8

    set -Ux fifc_editor vim
    set -U fifc_bat_opts --style=numbers

    # }}}
    # {{{ brew

    eval "$(brew shellenv)"

    # }}}
    # {{{ fifc

    fifc \
        -r '.*\*{2}.*' \
        -s 'rg --hidden -l --no-messages (string match -r -g \'.*\*{2}(.*)\' "$fifc_commandline")' \
        -p 'batgrep --color --paging=never (string match -r -g \'.*\*{2}(.*)\' "$fifc_commandline") "$fifc_candidate"' \
        -f "--query ''" \
        -o 'batgrep --color (string match -r -g \'.*\*{2}(.*)\' "$fifc_commandline") "$fifc_candidate" | less -R' \
        -O 1

    # }}}

end
