# smart urls
autoload -U url-quote-magic
autoload -Uz vcs_info
zle -N self-insert url-quote-magic

# pager
export PAGER="less -R"
export LC_CTYPE=$LANG

# default env vars (if not set)
if [[ -z "$TERM" ]]; then
	export TERM=xterm-256color
fi

export SYSTEMD_EDITOR=${SYSTEMD_EDITOR:-vim}
export EDITOR=${EDITOR:-vim}
export VIRTUAL=${VIRTUAL:-vim}
export COLORTERM="yes"
export KEYTIMEOUT=1
# pre execute functions
typeset -ga preexec_functions
typeset -ga precmd_functions
typeset -ga chpwd_functions
