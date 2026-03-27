# Push and pop directories on directory stack
alias pu='pushd'
alias po='popd'
alias dl='dirs -v | head -n10'

# Show history
alias history='fc -l 1'

# Quick shortcuts
alias _='sudo'
alias g='git'
alias md='mkdir -p'
mdc() { mkdir -p "$1" && cd "$1" || return; }

# Safety
alias mv='mv -i'
alias cp='cp -i'
command -v trash-put >/dev/null 2>&1 && alias rm='trash-put'

# List directory contents
alias ls='ls --color=auto'
if which ls++ &>/dev/null 2>&1; then
	alias l='ls++ --potsf -lAh --color'
	alias ll='ls++ --potsf -lAh --color'
else
	alias l='ls -lAh --color'
	alias ll='ls -lAh --color'
fi
alias la='ls -Alh --color'
alias lt='ls -Alht --color'

# grep
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# fd - don't ignore vcs-ignored files by default
command -v fd >/dev/null 2>&1 && alias fd='fd --no-ignore-vcs'

# bat aliases
command -v bat >/dev/null 2>&1 && {
  alias cat='bat --paging=never'
  alias less='bat --paging=always'
}

# Quick edits
alias zshrc='${EDITOR:-vim} ~/.config/zsh/.zshrc'
alias szshrc='source ~/.config/zsh/.zshrc'

# Git shortcuts
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git log --oneline --graph --decorate -20'
alias gd='git diff'
alias gco='git checkout'
alias gb='git branch'

# Docker shortcuts
alias dk='docker'
alias dkc='docker compose'
alias dkps='docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"'

# System
alias ports='ss -tulanp'
alias myip='curl -s ifconfig.me'
alias df='df -h'
alias du='du -h'

# Directory stack navigation
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias rd=rmdir
d() { [[ -n $1 ]] && dirs "$@" || dirs -v | head -n 10; }

# take - clone/extract and cd
take() {
  if [[ $1 =~ ^(https?|ftp).*\.(tar\.(gz|bz2|xz)|tgz)$ ]]; then
    local data; data=$(mktemp) && curl -L "$1" > "$data" && tar xf "$data" && rm "$data"
    cd "$(tar tf "$data" | head -1)" || return
  elif [[ $1 =~ ^(https?|ftp).*\.zip$ ]]; then
    local data; data=$(mktemp) && curl -L "$1" > "$data" && unzip "$data" && rm "$data"
  elif [[ $1 =~ ^([A-Za-z0-9]+@|https?|git|ssh|ftps?|rsync).*\.git/?$ ]]; then
    git clone "$1" && cd "$(basename ${1%%.git})" || return
  else
    mkdir -p "$@" && cd "${@:$#}" || return
  fi
}
