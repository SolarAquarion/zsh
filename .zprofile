# ZSH profile — loaded for login shells

# SSH agent
start_ssh_agent() {
    local ssh_env="$XDG_CACHE_HOME/ssh-env"
    if pgrep ssh-agent >/dev/null; then
        source "$ssh_env"
    else
        ssh-agent | grep -Fv echo > "$ssh_env"
        source "$ssh_env"
        ssh-add
    fi
}

# XDG
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export GNUPGHOME="$XDG_CONFIG_HOME/gnupg"
export GOPATH="$XDG_CONFIG_HOME/go"
export LESSHISTFILE="$XDG_CACHE_HOME/lesshist"
export NOTITLE=1
export XAUTHORITY="$XDG_RUNTIME_DIR/X11-authority"

# Python
source "$HOME/.rye/env"
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
