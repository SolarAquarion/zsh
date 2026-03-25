# Environment exports

autoload -U url-quote-magic
autoload -Uz vcs_info
zle -N self-insert url-quote-magic

export LC_CTYPE=$LANG

if [[ -z "$TERM" ]]; then
    export TERM=xterm-256color
fi

export SYSTEMD_EDITOR=${SYSTEMD_EDITOR:-vim}
export EDITOR=${EDITOR:-vim}
export COLORTERM="yes"
export KEYTIMEOUT=1

typeset -ga preexec_functions
typeset -ga precmd_functions
typeset -ga chpwd_functions
