# Useful fzf functions (adapted from BlaCk-Void-Zsh)

# ex - universal archive extractor
ex() {
  if [[ -f "$1" ]]; then
    case "$1" in
      *.tar.bz2)   tar xjf "$1"   ;;
      *.tar.gz)    tar xzf "$1"   ;;
      *.tar.xz)    tar xJf "$1"   ;;
      *.tar.zst)   tar xf "$1"    ;;
      *.bz2)       bunzip2 "$1"   ;;
      *.rar)       unrar x "$1"   ;;
      *.gz)        gunzip "$1"    ;;
      *.tar)       tar xf "$1"    ;;
      *.tbz2)      tar xjf "$1"   ;;
      *.tgz)       tar xzf "$1"   ;;
      *.zip)       unzip "$1"     ;;
      *.Z)         uncompress "$1";;
      *.7z)        7z x "$1"      ;;
      *.xz)        xz -d "$1"     ;;
      *.zst)       zstd -d "$1"   ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# cdf - cd into the directory of the selected file
cdf() {
  local file dir
  file=$(fzf +m -q "$1") && dir=$(dirname "$file") && cd "$dir" || return
}

# fco - checkout git branch/tag with fzf
fco() {
  local tags branches target
  branches=$(git --no-pager branch --all \
    --format="%(if)%(HEAD)%(then)%(else)%(if:equals=HEAD)%(refname:strip=3)%(then)%(else)%1B[0;34;1mbranch%09%1B[m%(refname:short)%(end)%(end)" \
    | sed '/^$/d') || return
  tags=$(git --no-pager tag | awk '{print "\x1b[35;1mtag\x1b[m\t" $1}') || return
  target=$((echo "$branches"; echo "$tags") | fzf --no-hscroll --no-multi -n 2 --ansi) || return
  git checkout "$(awk '{print $2}' <<<"$target")"
}

# fbr - checkout recent git branch
fbr() {
  local branches branch
  branches=$(git for-each-ref --count=30 --sort=-committerdate refs/heads/ --format="%(refname:short)") &&
  branch=$(echo "$branches" | fzf +m) &&
  git checkout "$(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")"
}

# fe - open selected file with editor
fe() {
  local files
  IFS=$'\n' files=($(fzf --query="$1" --multi --select-1 --exit-0))
  [[ -n "$files" ]] && ${EDITOR:-vim} "${files[@]}"
}

# da - docker attach to selected container
da() {
  local cid
  cid=$(docker ps -a | sed 1d | fzf -1 -q "$1" | awk '{print $1}')
  [[ -n "$cid" ]] && docker start "$cid" && docker attach "$cid"
}

# ds - docker stop selected container
ds() {
  local cid
  cid=$(docker ps -a | sed 1d | fzf -1 -q "$1" | awk '{print $1}')
  [[ -n "$cid" ]] && docker stop "$cid"
}

# autocp - copy with auto-backup if target exists
autocp() {
  local file="$1" target="$2"
  [[ "$file" == "$target" ]] && echo "Same file" && return 0
  if [[ -e "$target" ]]; then
    echo "$target exists, backing up to ${target}.bak"
    autocp "$target" "${target}.bak"
    rm -rf "$target"
  fi
  cp -rf "$file" "$target"
}

# automv - move with auto-backup if target exists
automv() {
  local file="$1" target="$2"
  [[ "$file" == "$target" ]] && echo "Same file" && return 0
  if [[ -e "$target" ]]; then
    echo "$target exists, backing up to ${target}.bak"
    automv "$target" "${target}.bak"
  fi
  mv -f "$file" "$target"
}
