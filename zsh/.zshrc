autoload -U colors && colors  # LOAD COLORS

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

## EXPORT EDITOR ##

export EDITOR="nvim"

## HISTORY ##

export HISTFILE="$HOME/.local/state/zsh/.zsh_history"
export HISTSIZE=1000000000
export SAVEHIST=1000000000

setopt INC_APPEND_HISTORY

## ZCOMPDUMP ##

compinit -d ~/.cache/zsh/zcompdump

## VIVID ##

export LS_COLORS="$(vivid generate gruvbox-plus)"

## PYTHON ##

export PYTHONSTARTUP="$HOME/.config/python/pythonrc"

## LOAD ALIASES ##

source $HOME/.config/shell/aliases

## PLUGINS ##

source $HOME/.config/zsh/plugins/cd-ls/cd-ls.zsh 2>/dev/null
source $HOME/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null

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
    zle -K viins # INITIATE `VI INSERT` AS KEYMAP (CAN BE REMOVED IF `BINDKEY -V` HAS BEEN SET ELSEWHERE)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # USE BEAM SHAPE CURSOR ON STARTUP
preexec() { echo -ne '\e[5 q' ;} # USE BEAM SHAPE CURSOR FOR EACH NEW PROMPT

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
source $HOME/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh 2>/dev/null
