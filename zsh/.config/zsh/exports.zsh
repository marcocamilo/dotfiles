#  ────────────────────────────────────────────────────────────────────
#   EXPORTS TO PATH                                                    
#  ────────────────────────────────────────────────────────────────────
#
export PATH="$PATH:$HOME/.local/bin"
export PATH="/usr/local/nvim/bin:$PATH"
# export PATH="/usr/local/"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# ──────────────────────────────────────────────────────────────────────
#   GCP                                                                
# ──────────────────────────────────────────────────────────────────────
# export GOOGLE_APPLICATION_CREDENTIALS="/home/Camilo-Pietri.M/service-accounts/camilo-pietri-m.json"
export GOOGLE_APPLICATION_CREDENTIALS="/home/Camilo-Pietri.M/.config/gcloud/application_default_credentials.json"

# ──────────────────────────────────────────────────────────────────────
#   OTHER VARIABLES                                                    
# ──────────────────────────────────────────────────────────────────────
export NLTK_DATA="$HOME/nlp-models/nltk_data/"
export FASTTEXT_MODEL_DIR="$HOME/nlp-models/fasttext"

#  ────────────────────────────────────────────────────────────────────
#   EDITOR                                                             
#  ────────────────────────────────────────────────────────────────────
export EDITOR=nvim
export VISUAL=nvim

# ──────────────────────────────────────────────────────────────────────
#   UV                                                                 
# ──────────────────────────────────────────────────────────────────────
export UV_PYTHON="3.10"
