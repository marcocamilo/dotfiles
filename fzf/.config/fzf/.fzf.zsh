# Setup fzf
# ---------
if [[ ! "$PATH" == *~/.config/fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}~/.config/fzf/bin"
fi

# Auto-completion
# ---------------
source "$HOME/.config/fzf/shell/completion.zsh"

# Key bindings
# ------------
source "$HOME/.config/fzf/shell/key-bindings.zsh"
