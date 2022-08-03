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
if [[ -z "$EDITOR" ]]; then
	export EDITOR=vim
	export VISUAL=$EDITOR
fi

# pre execute functions
typeset -ga preexec_functions
typeset -ga precmd_functions
typeset -ga chpwd_functions
