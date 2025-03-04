#  ────────────────────────────────────────────────────────────────────
#   COMMANDS                                                           
#  ────────────────────────────────────────────────────────────────────
alias b="batcat"
alias o="open ."
alias c="code ."
alias cl="clear"
alias cdc="cd; cl"
alias cdd="cd ~/Documents; cl"
alias nf="neofetch"

# confirm before overwriting something
alias cp="cp -i"
alias mv="mv -i"
# alias rm="trash -i"
# alias rm="rm -i"
alias rmf="rm -rf"

# list
alias ls="lsd"
alias lsa="lsd -a"
alias lsl="lsd -l"
alias lst="lsd --tree --depth=3"
alias lsat="lsd -a --tree --depth=2"
alias lsal="lsd -l -a"

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

#  ────────────────────────────────────────────────────────────────────
#   CUSTOM SCRIPTS                                                     
#  ────────────────────────────────────────────────────────────────────
# JOB SEARCH
alias newjob='source /Users/marcocamilo/Documents/Profession/Profile/Career\ Documents/Resume/newjob.sh'

# BUILD PROJECT
alias buildproj='source /Users/marcocamilo/Documents/Data\ Science/Resources/project_templates/ds-project/build_project.sh'

# ZOT2LOG
alias z2l="/usr/local/bin/zot2log"
alias z2ls="/usr/local/bin/zot2log search"
alias z2li="/usr/local/bin/zot2log import"
alias z2lp="/usr/local/bin/zot2log path"

# WORD SEARCH (PHONOLOGY FUNCTIONS)
alias ruws="/usr/local/bin/phonology_functions -lang ru -ws"
alias dews="/usr/local/bin/phonology_functions -lang de -ws"
alias fraws="/usr/local/bin/phonology_functions -lang fra -ws"
alias spaws="/usr/local/bin/phonology_functions -lang spa -ws"
alias enws="/usr/local/bin/phonology_functions -lang en -ws"
alias pows="/usr/local/bin/phonology_functions -lang po -ws"
alias itaws="/usr/local/bin/phonology_functions -lang ita -ws"

# ENVIRONMENT SEARCH (PHONOLOGY FUNCTIONS)
alias ruenv="/usr/local/bin/phonology_functions -lang ru -env"
alias deenv="/usr/local/bin/phonology_functions -lang de -env"
alias fraenv="/usr/local/bin/phonology_functions -lang fra -env"
alias spaenv="/usr/local/bin/phonology_functions -lang spa -env"
alias enenv="/usr/local/bin/phonology_functions -lang en -env"
alias poenv="/usr/local/bin/phonology_functions -lang po -env"
alias itaenv="/usr/local/bin/phonology_functions -lang ita -env"

# THINGS-CLI
alias th="things-cli"
alias tht="things-cli today"
alias thp="things-cli projects"
alias tha="things-cli areas"
alias thu="things-cli upcoming"
alias thl="things-cli logtoday"
