" Yank to system clipboard
set clipboard=unnamed

" ┌────────────────────────────────────────────────────────────────────┐
"   navigation keys                                                    
" └────────────────────────────────────────────────────────────────────┘
nnoremap j gj
nnoremap k gk
" ┌────────────────────────────────────────────────────────────────────┐
"   EDITING KEYS                                                       
" └────────────────────────────────────────────────────────────────────┘
" Better paste
vnoremap p "_dP

" Better cut
nnoremap x d
nnoremap xx dd
nnoremap X D

" Better delete
nnoremap d "_d
vnoremap d "_d
nnoremap D "_D
nnoremap <Del> "_x

" Better change
nnoremap c "_c
vnoremap c "_c

" ───────────────────────────────────────────────────────────────────
"  Insert                                                            
" ───────────────────────────────────────────────────────────────────
" Quickly exit insert mode
imap jk <Esc>

" ┌────────────────────────────────────────────────────────────────────┐
"   FOLD COMMANDS                                                      
" └────────────────────────────────────────────────────────────────────┘
exmap togglefold obcommand editor:toggle-fold
nmap zo :togglefold
nmap zc :togglefold
nmap za :togglefold

exmap unfoldall obcommand editor:unfold-all
nmap zR :unfoldall

exmap foldall obcommand editor:fold-all
nmap zM :foldall

exmap tabnext obcommand workspace:next-tab
nmap L :tabnext
exmap tabprev obcommand workspace:previous-tab
nmap H :tabprev

