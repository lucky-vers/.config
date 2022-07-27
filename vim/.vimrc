set number

if empty($MYVIMRC)         | let $MYVIMRC = expand('<sfile>:p')             | endif

if empty("~/.cache")       | let "~/.cache"        = $HOME."/.cache"        | endif
if empty("~/.config")      | let "~/.config"       = $HOME."/.config"       | endif
if empty("~/.local/share") | let "~/.local/share"  = $HOME."/.local/share"  | endif
if empty("~/.local/state") | let "~/.local/state"  = $HOME."/.local/state"  | endif

set runtimepath^=$HOME/.config/vim
set runtimepath+=$HOME/.local/share/vim
set runtimepath+=$HOME/.config/vim/after

set packpath^=$HOME/.local/share/vim,~/.config/vim
set packpath+=$HOME/.config/vim/after,~/.local/share/vim/after

let g:netrw_home = $HOME/.local/share."/vim"
call mkdir("$HOME/.local/share"."/vim/spell", 'p', 0700)

set backupdir="$HOME/.local/state/vim/backup"   | call mkdir(&backupdir, 'p', 0700)
set directory="$HOME/.local/state/vim/swap"     | call mkdir(&directory, 'p', 0700)
set undodir  ="$HOME/.local/state/vim/undo"     | call mkdir(&undodir,   'p', 0700)
set viewdir  ="$HOME/.local/state/vim/view"     | call mkdir(&viewdir,   'p', 0700)

if !has('nvim')
  set viminfofile="$HOME/.local/state/vim/viminfo"
endif
