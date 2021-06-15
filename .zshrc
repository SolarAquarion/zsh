# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export TERM="xterm-256color" 
# Check if zplug is installed
[[ -d ~/.zplug ]] || {
  git clone https://github.com/zplug/zplug ~/.zplug
  source ~/.zplug/init.zsh && zplug update --self
}
source ~/.zplug/init.zsh
source ~/.config/zsh/settings/plugs.zsh

zplug load
export GOPATH=~/.go
export PATH="$PATH:$GOPATH/bin"
export PATH="$PATH:/home/solaraquarion/.cargo/bin"
export PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"
export PATH="${PATH}:/home/${USER}/bin:${HOME}/.gem/ruby/2.3.0/bin"
source /usr/share/doc/find-the-command/ftc.zsh
if [[ $TERMINIX_ID  ]]; then
        source /etc/profile.d/vte.sh
      fi

#export PATH="/usr/lib/ccache/bin/:$PATH"
#export CCACHE_DIR=/tmp/ccache
export ENHANCD_FILTER=fzy:fzf:peco
export ENHANCD_FILTER
export WINEDEBUG=fixme-all
export WINEARCH=win64
#export JAVA_HOME="/usr/lib/jvm/java-8-openjdk"

#export ZULU_DIR=~/.zulu
#export ZULU_CONFIG_DIR=~/.config/zulu
# Initialise zulu plugin manager
#source "${ZULU_DIR:-"${ZDOTDIR:-$HOME}/.zulu"}/core/zulu"
#zulu init

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
