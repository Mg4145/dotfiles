ZSH_THEME = "robbyrussell"

zstyle ':omz:update' mode auto
zstyle ':omzupdate' frequency 1

ENABLE_CORRECTION="true"

plugins=(git zsh-autosuggestions colored-man-pages colorize fzf themes 
         common-aliases)

export EDITOR=nvim                                    # For git

alias vim='nvim' 
alias vi="nvim"
alias ls="ls --color=auto"
alias ldir='ls -d */'                                 # For listing directories
alias ll="ls -laF"
alias l="ls -CF"
alias cp="cp -i"
alias free="free -m"
alias rm="rm -i"
alias jp="jupyter-notebook"
alias carun="cargo build && cargo run"                # For Rust
alias icat='kitty +kitten icat'                       # For the kitty terminal
alias d="kitty +kitten diff"                          # For the kitty terminal
alias gitu="git add . && git commit && git push"      # For git 
# alias discord='discord --no-sandbox'                # For arch linux
