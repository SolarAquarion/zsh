# Safe .env loader (adapted from zush)
# Usage: apply_env [path]  (defaults to .env)
apply_env() {
  emulate -L zsh
  local target=${1:-.env}

  [[ -z "$target" ]] && { echo "apply_env: missing target" >&2; return 1; }
  [[ ! -e "$target" ]] && { echo "apply_env: '$target' does not exist" >&2; return 1; }
  [[ -d "$target" ]] && { echo "apply_env: '$target' is a directory" >&2; return 1; }
  [[ ! -r "$target" ]] && { echo "apply_env: '$target' is not readable" >&2; return 1; }

  local env_data
  env_data=$(cat -- "$target") || { echo "apply_env: failed to read '$target'" >&2; return 1; }

  if [[ -n $env_data ]]; then
    env_data+=$'\n'
    # Syntax check before applying
    if ! zsh -fn <<< "setopt allexport; $env_data" 2>/dev/null; then
      echo "apply_env: syntax error in '$target'" >&2
      return 1
    fi
    # Apply the environment
    setopt localoptions allexport
    eval "$env_data"
    echo "Applied environment from '$target'"
  fi
}
