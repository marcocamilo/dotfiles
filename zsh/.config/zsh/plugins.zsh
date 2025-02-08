#  ────────────────────────────────────────────────────────────────────
#   PLUGINS                                                            
#  ────────────────────────────────────────────────────────────────────

source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/local/share/zsh-autopair/autopair.zsh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $(brew --prefix)/opt/chruby/share/chruby/chruby.sh
source $(brew --prefix)/opt/chruby/share/chruby/auto.sh
chruby ruby-3.1.3

#  ────────────────────────────────────────────────────────────────────
#   FZF                                                                
#  ────────────────────────────────────────────────────────────────────
# Source fzf configuration if it exists
[ -f ~/.config/fzf/.fzf.zsh ] && source ~/.config/fzf/.fzf.zsh
source ~/.config/zsh/fzf-git.sh
export FZF_DEFAULT_OPTS='--preview "bat --style=numbers --color=always --line-range :500 {}"'

# Bind Ctrl+f to fzf-file-widget
bindkey '^F' fzf-file-widget
#
# export FZF_CTRL_R_OPTS="
#   --preview 'echo {}' --preview-window up:3:hidden:wrap
#   --bind 'ctrl-/:toggle-preview'
#   --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
#   --color header:italic
#   --header 'Press CTRL-Y to copy command into clipboard'"

#  ────────────────────────────────────────────────────────────────────
#   ITERM2 SHELL INTEGRATION                                           
#  ────────────────────────────────────────────────────────────────────
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

