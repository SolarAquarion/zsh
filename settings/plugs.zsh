# Bundles from the default repo (robbyrussell's oh-my-zsh).
zplug "zsh-users/zsh-completions"
zplug "willghatch/zsh-hooks"
zplug "zsh-users/zsh-history-substring-search", defer:3
zplug "zsh-users/zsh-completions"
zplug "zdharma/fast-syntax-highlighting", defer:3

zplug "softmoth/zsh-vim-mode", defer:3
zplug "chrissicool/zsh-256color"
zplug "mollifier/cd-gitroot"
zplug "Tarrasch/zsh-functional"
zplug "zsh-users/zsh-autosuggestions", defer:3
zplug "b4b4r07/enhancd", use:init.sh
zplug "supercrabtree/k"
zplug "psprint/zsh-cmd-architect"
# # Syntax highlighting bundle.
zplug "mafredri/zsh-async"
# # Load the theme.
zplug "romkatv/powerlevel10k", use:powerlevel10k.zsh-theme
zplug "RobSis/zsh-completion-generator"
zplug "fcambus/ansiweather"
zplug "arzzen/calc.plugin.zsh"
# Supports oh-my-zsh plugins and the like
zplug "plugins/command-not-found",   from:oh-my-zsh
zplug "hlissner/zsh-autopair", defer:2
zplug "psprint/zsh-navigation-tools"
zplug "psprint/zsh-editing-workbench"
zplug "desyncr/zsh-autocompl"
# Can manage local plugins
zplug "~/.config/zsh/settings", from:local
#zplug "~/.config/base16-shell", from:local
# A relative path is resolved with respect to the $ZPLUG_HOME
# zplug "repos/robbyrussell/oh-my-zsh/custom/plugins/my-plugin", from:local

# Install plugins if there are plugins that have not been installed
 if ! zplug check --verbose; then
     printf "Install? [y/N]: "
      if read -q; then
           echo; zplug install
     fi
 fi
# Then, source plugins and add commands to $PATH

if zplug check b4b4r07/enhancd; then
      # setting if enhancd is available
          export ENHANCD_FILTER=fzf-tmux
         fi
