

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


export TERM="xterm-256color"

### Zinit plugin manager (system-installed)
source /usr/share/zinit/zinit.zsh
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

source ~/.config/zsh/settings/plugs.zsh

export GOPATH=~/.go
export PATH="$PATH:$GOPATH/bin"
export PATH="$PATH:$HOME/.cargo/bin"

export ENHANCD_FILTER=fzf-tmux

export WINEDEBUG=fixme-all
source /usr/share/doc/find-the-command/ftc.zsh
export WINEARCH=win64
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/keyring/ssh"

export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

## [Completion]
## Completion scripts setup. Remove the following line to uninstall
[[ -f /home/solaraquarion/.config/.dart-cli-completion/zsh-config.zsh ]] && . /home/solaraquarion/.config/.dart-cli-completion/zsh-config.zsh || true
## [/Completion]

# OpenClaw Completion
source "/home/solaraquarion/.openclaw/completions/openclaw.zsh"

export ARGC_COMPLETIONS_ROOT="$HOME/.local/share/argc-completions"
export ARGC_COMPLETIONS_PATH="$ARGC_COMPLETIONS_ROOT/completions/linux:$ARGC_COMPLETIONS_ROOT/completions"
export PATH="$ARGC_COMPLETIONS_ROOT/bin:$PATH"
argc_scripts=( $(ls -p -1 "$ARGC_COMPLETIONS_ROOT/completions/linux" "$ARGC_COMPLETIONS_ROOT/completions" | sed -n 's/\.sh$//p') )
source <(argc --argc-completions zsh $argc_scripts)
