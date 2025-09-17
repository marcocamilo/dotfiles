#  ────────────────────────────────────────────────────────────────────
#   PLUGINS                                                            
#  ────────────────────────────────────────────────────────────────────
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#  ────────────────────────────────────────────────────────────────────
#   FZF                                                                
#  ────────────────────────────────────────────────────────────────────
# Source fzf configuration if it exists
[ -f ~/.config/fzf/.fzf.zsh ] && source ~/.config/fzf/.fzf.zsh
source ~/.config/zsh/fzf-git.sh
export FZF_DEFAULT_OPTS='--preview "bat --style=numbers --color=always --line-range :500 {}"'

# Bind Ctrl+f to fzf-file-widget
bindkey '^F' fzf-file-widget
export FZF_COMPLETION_TRIGGER=';'
