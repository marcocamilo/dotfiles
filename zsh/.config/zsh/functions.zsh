#  ────────────────────────────────────────────────────────────────────
#   DIRECTORY COMMANDS                                                   
#  ────────────────────────────────────────────────────────────────────
# make and enter directory
mkcd() {
    mkdir -p "${1}"
    cd "${1}"
}

# preview csv files
csv () {
  csvlens "${1}"
}

# lf + enter directory
lcd () {
    tmp="$(mktemp)"
    # `command` is needed in case `lfcd` is aliased to `lf`
    command lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        if [ -d "$dir" ]; then
            if [ "$dir" != "$(pwd)" ]; then
                cd "$dir"
            fi
        fi
    fi
}
#  ────────────────────────────────────────────────────────────────────
#   LIVE GREP                                                          
#  ────────────────────────────────────────────────────────────────────
rfv() (
  RELOAD='reload:rg --column --color=always --smart-case {q} || :'
  OPENER='if [[ $FZF_SELECT_COUNT -eq 0 ]]; then
            nvim {1} +{2}     # No selection. Open the current line in Vim.
          else
            nvim +cw -q {+f}  # Build quickfix list for the selected items.
          fi'
  fzf --disabled --ansi --multi \
      --bind "start:$RELOAD" --bind "change:$RELOAD" \
      --bind "enter:become:$OPENER" \
      --bind "ctrl-o:execute:$OPENER" \
      --bind 'alt-a:select-all,alt-d:deselect-all,ctrl-/:toggle-preview' \
      --delimiter : \
      --preview 'bat --style=full --color=always --highlight-line {2} {1}' \
      --preview-window '~4,+{2}+4/3,<80(up)' \
      --query "$*"
)

#  ────────────────────────────────────────────────────────────────────
#   SHORTCUTS                                                          
#  ────────────────────────────────────────────────────────────────────
# tmux attach
mxa () {
  tmux attach -t "${1}"
}

# tmux create session
mxs () {
  tmux new-session -s "${1}"
}

mxl () {
  tmux ls
}

#  ────────────────────────────────────────────────────────────────────
#   PYTHON                                                             
#  ────────────────────────────────────────────────────────────────────
# create jupyter notebook
create-ipynb() {
    # Check if an argument is provided
    if [ -z "$1" ]; then
        echo "Usage: create_ipynb <filename>"
        return 1
    fi

    # Add .ipynb extension to the filename
    filename="$1.ipynb"

    # Specify the content for the IPython notebook with the argument as title
    content='{
 "cells": [
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "# '"$1"'"
   ]
  }
 ],
 "metadata": {
  "kernelspec": {
   "display_name": "Python 3 (ipykernel)",
   "language": "python",
   "name": "python3"
  },
  "language_info": {
   "codemirror_mode": {
    "name": "ipython",
    "version": 3
   },
   "file_extension": ".py",
   "mimetype": "text/x-python",
   "name": "python",
   "nbconvert_exporter": "python",
   "pygments_lexer": "ipython3",
   "version": "3.10.5"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 2
}'

    # Create the IPython notebook with the specified content
    echo "$content" > "$filename"
    echo "IPython notebook created: $filename"
}
