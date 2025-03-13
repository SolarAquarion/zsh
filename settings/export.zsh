# jenegunn/fzf
export FZF_DEFAULT_OPTS='
--extended
--ansi
--multi
'

ENHANCD_FILTER=zsh; export ENHANCD_FILTER

export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules}/*" 2>/dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS='--preview="bat --color=always --style=header {} 2>/dev/null" --preview-window=right:60%:wrap'
export FZF_ALT_C_COMMAND='fd --type d --strip-cwd-prefix | awk -F'\''/'\'' '\''{ print NF, $0 }'\'' | sort -n | cut -d" " -f2-'
export FZF_ALT_C_OPTS='--preview="eza -1 --icons --git --git-ignore {}" --preview-window=right:60%:wrap'

# Ctrl-R mode — history search
export FZF_CTRL_R_OPTS="\
  --height=~30%
  --layout=default
  --preview='echo {}'
  --preview-window='right,50%,border-left,wrap,<60(down,10%,border-top,wrap)'
  --bind='ctrl-/:toggle-preview'
  --bind='ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
  --header='⌃R relevance/chronological • ⌃Y to clipboard • ⌃/ preview'
  --header-first
  "

# FZF options for zoxide prompt (zi)
export _ZO_FZF_OPTS=$FZF_DEFAULT_OPTS'
--height=7'
# Set less or more as the default pager.
if [[ -z ${PAGER}  ]]; then
  if (( ${+commands[less]}  )); then
    export PAGER=less
  else
    export PAGER=more
  fi
fi
