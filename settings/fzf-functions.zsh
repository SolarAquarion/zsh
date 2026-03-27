# Useful fzf functions (adapted from BlaCk-Void-Zsh)

# extract - universal archive extractor (see omz-local.zsh for local implementation)

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
