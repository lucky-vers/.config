# bindkey -M menuselect 'h' vi-backward-char
# bindkey -M menuselect 'k' vi-up-line-or-history
# bindkey -M menuselect 'l' vi-forward-char
# bindkey -M menuselect 'j' vi-down-line-or-history
# bindkey -v '^?' backward-delete-char

autoload -U colors && colors	# Load colors

## COLORIZE MAN PAGES ##

function man() {
  env \
    LESS_TERMCAP_md=$(tput bold; tput setaf 4) \
    LESS_TERMCAP_me=$(tput sgr0) \
    LESS_TERMCAP_mb=$(tput blink) \
    LESS_TERMCAP_us=$(tput setaf 2) \
    LESS_TERMCAP_ue=$(tput sgr0) \
    LESS_TERMCAP_so=$(tput smso) \
    LESS_TERMCAP_se=$(tput rmso) \
    PAGER="${commands[less]:-$PAGER}" \
    man "$@"
}

## HISTORY ##

HISTSIZE=10000000
SAVEHIST=10000000

HISTFILE="$HOME/.cache/zsh/history"

## LOAD ALIASES ##

source $HOME/.config/shell/aliases

## PLUGINS ##

source $HOME/.config/zsh/plugins/cd-ls/cd-ls.zsh
source $HOME/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

## ENABLE VI MODE ##

bindkey -v
export KEYTIMEOUT=1

## CHANGE CURSOR SHAPE FOR DIFFERENT VI MODES ##

function zle-keymap-select () {
    case $KEYMAP in
        vicmd) echo -ne '\e[1 q';;      # block
        viins|main) echo -ne '\e[5 q';; # beam
    esac
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

## BASIC AUTOCOMPLETE ##

autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots) # INCLUDE HIDDEN FILES

### USE VIM KEYS TO AUTOCOMPLETE ###

bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

eval "$(starship init zsh)"
source $HOME/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh