# jenegunn/fzf
export FZF_DEFAULT_OPTS='
--extended
--ansi
--multi
'

ENHANCD_FILTER=zsh; export ENHANCD_FILTER

# Set less or more as the default pager.
if [[ -z ${PAGER}  ]]; then
  if (( ${+commands[less]}  )); then
    export PAGER=less
  else
    export PAGER=more
  fi
fi
