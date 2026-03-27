# Utility functions extracted and adapted from zpwr (MenkeTechnologies)
# All made framework-independent

# dsize - list directory contents sorted by size
dsize() {
  local dir="${1:-.}" hidden="${2}"
  if [[ "$hidden" == "-a" ]]; then
    du -sh "$dir"/.* "$dir"/* 2>/dev/null | sort -hr
  else
    du -sh "$dir"/* 2>/dev/null | sort -hr
  fi
}

# removespaces - remove trailing whitespace from files
removespaces() {
  for file in "$@"; do
    [[ -f "$file" ]] || { echo "Not a file: $file" >&2; continue; }
    echo "Cleaning: $file"
    sed -i -e 's/[[:space:]]*$//' -e '/^$/N;/^\n$/d' "$file"
  done
}

# fixshebang - change shebang line of scripts
fixshebang() {
  local interp="${1:?Usage: fixshebang <interpreter> <file...>}"
  shift
  for file in "$@"; do
    [[ -f "$file" ]] || { echo "Not a file: $file" >&2; continue; }
    sed -i "1s@^#!.*@#!/usr/bin/env $interp@" "$file"
    chmod +x "$file"
    echo "Fixed: $file → #!/usr/bin/env $interp"
  done
}

# mkscript - create a script from template
mkscript() {
  local type="${1:?Usage: mkscript <bash|zsh|python|node> <name>}"
  local name="${2:?Usage: mkscript <bash|zsh|python|node> <name>}"
  local shebang header

  case "$type" in
    bash)   shebang="#!/usr/bin/env bash" ;;
    zsh)    shebang="#!/usr/bin/env zsh" ;;
    python) shebang="#!/usr/bin/env python3" ;;
    node)   shebang="#!/usr/bin/env node" ;;
    *)      echo "Unknown type: $type" >&2; return 1 ;;
  esac

  header="${shebang}
# Created: $(date -Iseconds)
# Purpose: ${type} script

"

  if [[ -f "$name" ]]; then
    echo "$name already exists" >&2
    return 1
  fi

  echo "$header" > "$name"
  chmod +x "$name"
  echo "Created: $name"
  ${EDITOR:-vim} "$name"
}

# shrm - secure file removal (overwrite then delete)
shrm() {
  for file in "$@"; do
    [[ -e "$file" ]] || { echo "Not found: $file" >&2; continue; }
    if command -v shred &>/dev/null; then
      shred -vfz -n 3 "$file" && rm -f "$file"
    else
      # Fallback: overwrite with zeros then delete
      local size
      size=$(stat -c%s "$file" 2>/dev/null || stat -f%z "$file" 2>/dev/null)
      dd if=/dev/zero of="$file" bs=1 count="$size" 2>/dev/null
      rm -f "$file"
    fi
    echo "Securely removed: $file"
  done
}

# showkeybindings - show zsh keybindings in fzf
showkeybindings() {
  bindkey | fzf --reverse --header="ZSH Keybindings" \
    --preview 'echo {} | bat -l zsh --color=always' \
    --preview-window=down:30%
}

# pathcount - count commands in PATH
pathcount() {
  local count=0
  local dirs=(${(s.:.)PATH})
  for dir in $dirs; do
    [[ -d "$dir" ]] && count=$((count + $(ls -1 "$dir" 2>/dev/null | wc -l)))
  done
  echo "Commands in PATH: $count"
}

# dupes - find duplicate files by size then hash
dupes() {
  local dir="${1:-.}"
  echo "Finding duplicates in $dir..."
  find "$dir" -type f -not -path '*/.git/*' -print0 |
    xargs -0 -n1 md5sum 2>/dev/null |
    sort |
    uniq -w32 -dD
}

# fordir - run a command in each subdirectory
fordir() {
  local cmd="${1:?Usage: fordir <command> [dir]}"
  local base="${2:-.}"
  for dir in "$base"/*/; do
    [[ -d "$dir" ]] || continue
    echo "=== $dir ==="
    (cd "$dir" && eval "$cmd")
    echo ""
  done
}
