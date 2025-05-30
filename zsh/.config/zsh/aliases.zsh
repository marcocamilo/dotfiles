#  ────────────────────────────────────────────────────────────────────
#   COMMANDS                                                           
#  ────────────────────────────────────────────────────────────────────
alias b="bat"
alias o="open ."
alias c="code ."
alias cl="clear"
alias cdc="cd; cl"
alias cdd="cd ~/Documents; cl"
alias nf="neofetch"

# confirm before overwriting something
alias cp="cp -i"
alias mv="mv -i"
alias rmf="rm -rf"

# list
alias ls="lsd"
alias lsa="lsd -a"
alias lsl="lsd -l"
alias lst="lsd --tree --depth=2"
alias lsat="lsd -a --tree --depth=2"
alias lsal="lsd -l -a"
alias lsalt="lsd -l -a --tree --depth=2"

# ──────────────────────────────────────────────────────────────────────
#   UTILITIES                                                          
# ──────────────────────────────────────────────────────────────────────
alias tl="tldr"
alias fdh="fd --hidden"
alias tr="trashy put"
alias trl="trashy list"
alias trr="trashy restore"
alias trx="trashy empty"

# ──────────────────────────────────────────────────────────────────────
#   UTILITIES                                                          
# ──────────────────────────────────────────────────────────────────────
alias tl="tldr"
alias fdh="fd --hidden"

#  ────────────────────────────────────────────────────────────────────
#   PROGRAMS                                                           
#  ────────────────────────────────────────────────────────────────────
alias py="python"
alias ip="ipython"
alias venv="virtualenv"

alias v="nvim"
alias em="emacs -nw"
alias pistol="~/.go/bin/pistol"
alias sio="/usr/local/bin/sioyek"
alias lg="lazygit"
alias tree="tree --filesfirst"
alias fzt="fzf-tmux"

alias bws="brew search"
alias bwi="brew install"
alias bwu="brew uninstall"
alias bwf="brew info"
alias bwlc="brew list --cask"
alias bwlf="brew list --formulae"

# ──────────────────────────────────────────────────────────────────────
#   GIT                                                                
# ──────────────────────────────────────────────────────────────────────
alias gt="git log --graph --abbrev-commit --decorate --oneline"
alias gta="git log --graph --abbrev-commit --decorate --oneline --all"
alias gac="git add *; git commit -m"

# ──────────────────────────────────────────────────────────────────────
#   UV                                                                 
# ──────────────────────────────────────────────────────────────────────
alias activate="source .venv/bin/activate"
alias uvjl="uv run --with jupyter jupyter lab"
alias uvib="uv init --bare"

# ──────────────────────────────────────────────────────────────────────
#   TERRAFORM                                                          
# ──────────────────────────────────────────────────────────────────────
alias tfv="terraform validate"
alias tfp="terraform plan"
alias tfa="terraform apply"

#  ────────────────────────────────────────────────────────────────────
#  CONFIGURATION FILES
#  ────────────────────────────────────────────────────────────────────
alias vrc="nvim ~/.config/nvim/"
alias mxrc="nvim ~/.tmux.conf"
alias kittyrc="nvim ~/.config/kitty/kitty.conf"

alias zr="nvim ~/.zshrc"
alias zra="nvim ~/.config/zsh/aliases.zsh"
alias zrb="nvim ~/.config/zsh/bindings.zsh"
alias zre="nvim ~/.config/zsh/environments.zsh"
alias zrx="nvim ~/.config/zsh/exports.zsh"
alias zrf="nvim ~/.config/zsh/functions.zsh"
alias zro="nvim ~/.config/zsh/options.zsh"
alias zrp="nvim ~/.config/zsh/plugins.zsh"

#  ────────────────────────────────────────────────────────────────────
#   SOURCE CONFIGS                                                     
#  ────────────────────────────────────────────────────────────────────
alias szr="source ~/.zshrc"
alias smx="source ~/.tmux.conf"
