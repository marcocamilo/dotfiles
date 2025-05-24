#  ────────────────────────────────────────────────────────────────────
#   DEFAULT OPTIONS                                                    
#  ────────────────────────────────────────────────────────────────────
# bindkey -e
#  ────────────────────────────────────────────────────────────────────
#   COMMAND MODIFICATIONS                                              
#  ────────────────────────────────────────────────────────────────────
# ls command
alias ls='ls -G'
export CLICOLOR=1
export LSCOLORS=gxFxCxDxBxegedabagaced

#  ────────────────────────────────────────────────────────────────────
#   AUTOCOMPLETION                                                     
#  ────────────────────────────────────────────────────────────────────
autoload -Uz compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

#  ────────────────────────────────────────────────────────────────────
#   VIM MODE                                                           
#  ────────────────────────────────────────────────────────────────────
# # vi mode
# bindkey -v
# export KEYTIMEOUT=1
#
# # Use vim keys in tab complete menu:
# bindkey -M menuselect 'h' vi-backward-char
# bindkey -M menuselect 'k' vi-up-line-or-history
# bindkey -M menuselect 'l' vi-forward-char
# bindkey -M menuselect 'j' vi-down-line-or-history
# bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
# function zle-keymap-select {
#   if [[ ${KEYMAP} == vicmd ]] ||
#      [[ $1 = 'block' ]]; then
#     echo -ne '\e[1 q'
#   elif [[ ${KEYMAP} == main ]] ||
#        [[ ${KEYMAP} == viins ]] ||
#        [[ ${KEYMAP} = '' ]] ||
#        [[ $1 = 'beam' ]]; then
#     echo -ne '\e[5 q'
#   fi
# }
#
# zle -N zle-keymap-select
# zle-line-init() {
#     zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
#     echo -ne "\e[5 q"
# }
#
# zle -N zle-line-init
# echo -ne '\e[5 q' # Use beam shape cursor on startup.
# preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

#  ────────────────────────────────────────────────────────────────────
#   HISTORY                                                            
#  ────────────────────────────────────────────────────────────────────
# history config
export HISTFILE=$ZSH/.zsh_history

# How many commands zsh will load to memory.
export HISTSIZE=10000000               

# How many commands history will save on file.
export SAVEHIST=10000000               

# History won't save duplicates.
setopt HIST_IGNORE_ALL_DUPS

# History won't show duplicates on search.
setopt HIST_FIND_NO_DUPS
