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

#  ────────────────────────────────────────────────────────────────────
#   FINAL PROMPTS                                                      
#  ────────────────────────────────────────────────────────────────────
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# neofetch
unset ZSH_AUTOSUGGEST_USE_ASYNC

#  ────────────────────────────────────────────────────────────────────
#   ZOXIDE                                                      
#  ────────────────────────────────────────────────────────────────────
eval "$(zoxide init zsh)"

#  ────────────────────────────────────────────────────────────────────
#   STARSHIP                                                           
#  ────────────────────────────────────────────────────────────────────
export STARSHIP_CONFIG=~/.config/starship/starship.toml
eval "$(starship init zsh)"

#  ────────────────────────────────────────────────────────────────────
#   UV PATH                                                            
#  ────────────────────────────────────────────────────────────────────
. "$HOME/.local/bin/env"
