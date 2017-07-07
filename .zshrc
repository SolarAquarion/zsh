export TERM="xterm-256color"
# Check if zplug is installed
POWERLEVEL9K_MODE='awesome-fontconfig'
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir rbenv vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status history time)
# enable the vcs segment in general
 POWERLEVEL9K_SHOW_CHANGESET=true
 # just show the 15 first characters of changeset
POWERLEVEL9K_CHANGESET_HASH_LENGTH=15
source ~/.config/base16-shell/scripts/base16-gruvbox-dark-hard.sh  
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
export JAVA_HOME="/usr/lib/jvm/java-8-openjdk"
export __GLVND_DISALLOW_PATCHING=1
http_proxy="http://localhost:8118"

#export ZULU_DIR=~/.zulu
#export ZULU_CONFIG_DIR=~/.config/zulu
# Initialise zulu plugin manager
#source "${ZULU_DIR:-"${ZDOTDIR:-$HOME}/.zulu"}/core/zulu"
#zulu init
