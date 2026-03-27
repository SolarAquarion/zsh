# Local replacements for OMZ plugins

# === OMZP::common-aliases ===
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'

# === OMZP::copyfile ===
function copyfile() {
  emulate -L zsh
  if [[ -z "$WAYLAND_DISPLAY" ]] && [[ -z "$DISPLAY" ]]; then
    echo "No display found" && return 1
  fi
  local file="$1"
  if [[ -z "$file" ]]; then
    echo "Usage: copyfile <file>" && return 1
  fi
  if [[ ! -f "$file" ]]; then
    echo "File not found: $file" && return 1
  fi
  if [[ -n "$WAYLAND_DISPLAY" ]]; then
    wl-copy < "$file"
  else
    xclip -selection clipboard < "$file"
  fi
}

# === OMZP::copypath ===
function copypath() {
  emulate -L zsh
  if [[ -z "$WAYLAND_DISPLAY" ]] && [[ -z "$DISPLAY" ]]; then
    echo "No display found" && return 1
  fi
  local dir="${1:-.}"
  if [[ -n "$WAYLAND_DISPLAY" ]]; then
    echo -n "$(realpath "$dir")" | wl-copy
  else
    echo -n "$(realpath "$dir")" | xclip -selection clipboard
  fi
  echo "Copied $(realpath "$dir") to clipboard"
}

# === OMZP::dircycle ===
# Cycle through directory stack with Ctrl+Shift+Left/Right
setopt AUTO_PUSHD PUSHD_SILENT PUSHD_TO_HOME
DIRSTACKSIZE=8
zstyle ':completion:*' list-suffixes
zstyle ':completion:*' expand prefix suffix

bindkey '\e[1;6D' insert-cycledleft
bindkey '\e[1;6C' insert-cycledright

insert-cycledleft() {
  zle push-line
  builtin cd -1 > /dev/null 2>&1
  zle reset-prompt
}
insert-cycledright() {
  zle push-line
  builtin cd +0 > /dev/null 2>&1
  zle reset-prompt
}
zle -N insert-cycledleft
zle -N insert-cycledright

# === OMZP::dirhistory ===
# Navigate directory history with Alt+Left/Right
bindkey '\e[1;3D' _dirhistory_cd_past
bindkey '\e[1;3C' _dirhistory_cd_future

_dirhistory_cd_past() {
  zle push-line
  builtin cd -1 > /dev/null 2>&1
  zle reset-prompt
}
_dirhistory_cd_future() {
  zle push-line
  builtin cd +0 > /dev/null 2>&1
  zle reset-prompt
}
zle -N _dirhistory_cd_past
zle -N _dirhistory_cd_future

# === OMZP::extract ===
function extract() {
  if [[ -z "$1" ]]; then
    echo "Usage: extract <file>"
    return 1
  fi
  local target="$1"
  if [[ ! -f "$target" ]]; then
    echo "File not found: $target"
    return 1
  fi
  case "$target" in
    *.tar.bz2)  tar xjf "$target"   ;;
    *.tar.gz)   tar xzf "$target"   ;;
    *.tar.xz)   tar xJf "$target"   ;;
    *.bz2)      bunzip2 "$target"   ;;
    *.rar)      unrar x "$target"   ;;
    *.gz)       gunzip "$target"    ;;
    *.tar)      tar xf "$target"    ;;
    *.tbz2)     tar xjf "$target"   ;;
    *.tgz)      tar xzf "$target"   ;;
    *.zip)      unzip "$target"     ;;
    *.Z)        uncompress "$target";;
    *.7z)       7z x "$target"      ;;
    *.xz)       xz -d "$target"     ;;
    *)          echo "Unknown archive: $target" ;;
  esac
}

# === OMZP::fancy-ctrl-z ===
function fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

# === OMZP::globalias ===
# Expand aliases with space
globalias() {
  local word=${${(Az)LBUFFER}[-1]}
  if [[ $LBUFFER =~ '^[^ ]+ $' ]]; then
    zle _expand_alias
  fi
  zle self-insert
}
zle -N globalias
bindkey " " globalias

# === OMZP::jsontools ===
alias pp_json='python -m json.tool'
alias is_json='python -m json.tool > /dev/null 2>&1'

# === OMZP::colored-man-pages / man ===
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;38;5;74m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[38;5;246m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[04;38;5;146m'

# === OMZP::safe-paste ===
# Already loaded via standalone plugin oz/safe-paste

# === OMZP::sudo ===
# Press Escape twice to prepend sudo
sudo-command-line() {
  [[ -z $BUFFER ]] && zle up-history
  if [[ $BUFFER == sudo\ * ]]; then
    LBUFFER="${LBUFFER#sudo }"
  elif [[ $BUFFER == sudoedit\ * ]]; then
    LBUFFER="${LBUFFER#sudoedit }"
    LBUFFER="sudoedit ${LBUFFER}"
  else
    LBUFFER="sudo ${LBUFFER}"
  fi
}
zle -N sudo-command-line
bindkey '\e\e' sudo-command-line

# === OMZP::urltools / omz_urlencode ===
function omz_urlencode() {
  emulate -L zsh
  local length="${#1}"
  for ((i = 1; i <= length; i++)); do
    local c="${1[i]}"
    if [[ "$c" =~ [a-zA-Z0-9.~_-] ]]; then
      echo -n "$c"
    else
      printf '%%%02X' "'$c"
    fi
  done
  echo
}

function omz_urldecode() {
  emulate -L zsh
  local encoded="$1"
  # Process percent-encoded characters
  echo -n "${encoded//\%/\\x}" | read -r decoded
  echo -n "$decoded"
}

# === OMZP::web-search ===
function web_search() {
  emulate -L zsh
  local url
  case "$1" in
    google)    url="https://www.google.com/search?q=" ;;
    duckduckgo) url="https://duckduckgo.com/?q=" ;;
    github)    url="https://github.com/search?q=" ;;
    stackoverflow) url="https://stackoverflow.com/search?q=" ;;
    *)         echo "Usage: web_search [google|duckduckgo|github|stackoverflow] <query>" && return 1 ;;
  esac
  shift
  local query="${*}"
  query=$(omz_urlencode "$query")
  xdg-open "${url}${query}" 2>/dev/null || echo "Open: ${url}${query}"
}
alias gg='web_search google'
alias ddg='web_search duckduckgo'
alias gh='web_search github'
alias so='web_search stackoverflow'

# === OMZP::command-not-found (Arch Linux) ===
function command_not_found_handler() {
  local cmd="$1"
  echo "zsh: command not found: $cmd"
  if command -v pacman &>/dev/null; then
    local pkg=$(pacman -Fs "$cmd" 2>/dev/null | head -1)
    if [[ -n "$pkg" ]]; then
      echo "Install with: sudo pacman -S $(echo "$pkg" | awk '{print $2}')"
    fi
  fi
  return 127
}

# === OMZP::dotenv ===
# Auto-load .env files when entering directories
autoload -U add-zsh-hook
_load_dotenv() {
  if [[ -f .env ]]; then
    set -a
    source .env
    set +a
  fi
}
add-zsh-hook chpwd _load_dotenv

# === OMZP::genpass ===
function genpass() {
  local length="${1:-16}"
  tr -dc 'A-Za-z0-9!@#$%^&*' < /dev/urandom | head -c "$length"
  echo
}

# === OMZP::perms ===
alias 000='chmod 000'
alias 644='chmod 644'
alias 755='chmod 755'
alias 777='chmod 777'
