# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export TERM="xterm-256color" 

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source ~/.config/zsh/settings/autosuggest.zsh  
source ~/.config/zsh/settings/completion.zsh  
source ~/.config/zsh/settings/environment.zsh  
source ~/.config/zsh/settings/git.zsh      
source ~/.config/zsh/settings/paths.zsh
source ~/.config/zsh/settings/bzr.zsh		 c
source ~/.config/zsh/settings/correction.zsh  
source ~/.config/zsh/settings/export.zsh	  
source ~/.config/zsh/settings/grep.zsh     
source ~/.config/zsh/settings/clipboard.zsh	 
source ~/.config/zsh/settings/directory.zsh	 
source ~/.config/zsh/settings/functions.zsh	  
source ~/.config/zsh/settings/history.zsh  
source ~/.config/zsh/settings/substring.zsh

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

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
