#  ────────────────────────────────────────────────────────────────────
#   SOURCES                                                            
#  ────────────────────────────────────────────────────────────────────

PROMPT='marco_camilo %1~/ %# '
export ZSH=$HOME/.config/zsh
source $ZSH/exports.zsh
source $ZSH/environments.zsh
source $ZSH/plugins.zsh
source $ZSH/functions.zsh
source $ZSH/options.zsh
source $ZSH/aliases.zsh

# neofetch
unset ZSH_AUTOSUGGEST_USE_ASYNC

#  ────────────────────────────────────────────────────────────────────
#   FZF                                                                
#  ────────────────────────────────────────────────────────────────────
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#  ────────────────────────────────────────────────────────────────────
#   ZOXIDE                                                      
#  ────────────────────────────────────────────────────────────────────
eval "$(zoxide init zsh)"

# ──────────────────────────────────────────────────────────────────────
#   DIRENV                                                             
# ──────────────────────────────────────────────────────────────────────
eval "$(direnv hook zsh)"

# ──────────────────────────────────────────────────────────────────────
#   CURLIE                                                             
# ──────────────────────────────────────────────────────────────────────
# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

#  ────────────────────────────────────────────────────────────────────
#   STARSHIP                                                           
#  ────────────────────────────────────────────────────────────────────
export STARSHIP_CONFIG=~/.config/starship/starship.toml
eval "$(starship init zsh)"
