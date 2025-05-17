#!/opt/homebrew/bin/fish

# File listing aliases
alias l 'ls -lah'
alias ll 'ls -lh'
alias la 'ls -lAh'
alias lt 'ls -lth'
alias ltr 'ls -ltrh'
alias ls 'ls -G'
alias lsd 'ls -d */'
alias lsz 'ls -lahS'
alias lsr 'ls -lahR'
alias lsg 'ls -lah | grep'

# Cargo aliases
alias cu 'cargo update'

# General aliases
alias x 'exit'
alias c 'clear'

# Git shortcuts
alias gs 'git status -sb'
alias gst 'git status'
alias gsv 'git status -v'

# pnpm shortcuts
alias pn 'pnpm'
alias pna 'pnpm add'
alias pnad 'pnpm add -D'
alias pni 'pnpm install'
alias pnr 'pnpm run'
alias pnb 'pnpm build'
alias pnd 'pnpm dev'
alias pns 'pnpm start'
alias pnt 'pnpm test'

# npm shortcuts
alias ni 'npm install'
alias na 'npm add'
alias nad 'npm add -D'
alias nr 'npm run'
alias nb 'npm run build'
alias nd 'npm run dev'
alias ns 'npm run start'
alias nt 'npm run test'

# yarn shortcuts
alias ya 'yarn add'
alias yad 'yarn add -D'
alias yi 'yarn install'
alias yr 'yarn run'
alias yb 'yarn build'
alias yd 'yarn dev'
alias ys 'yarn start'
alias yt 'yarn test' 