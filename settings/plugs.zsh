# Bundles from the default repo (robbyrussell's oh-my-zsh).
zinit load "zsh-users/zsh-completions"
zinit load "willghatch/zsh-hooks"
zinit load "zsh-users/zsh-history-substring-search", wait:3
zinit load "zsh-users/zsh-completions"
zinit load "zdharma/fast-syntax-highlighting", wait:2

zinit load "softmoth/zsh-vim-mode", wait:3
zinit load "chrissicool/zsh-256color"
zinit load "mollifier/cd-gitroot"
zinit load "Tarrasch/zsh-functional"
zinit load "zsh-users/zsh-autosuggestions", defer:3
zinit load "b4b4r07/enhancd", pick:init.sh
zinit load "supercrabtree/k"
zinit load "psprint/zsh-cmd-architect"
# # Syntax highlighting bundle.
zinit load "mafredri/zsh-async"
# # Load the theme.
zinit load "romkatv/powerlevel10k", pick:powerlevel10k.zsh-theme
zinit load "RobSis/zsh-completion-generator"
zinit load "fcambus/ansiweather"
zinit load "arzzen/calc.plugin.zsh"
# Supports oh-my-zsh plugins and the like
zinit load "plugins/command-not-found",   from:oh-my-zsh
zinit load "hlissner/zsh-autopair", defer:3
zinit load "psprint/zsh-navigation-tools"
zinit load "psprint/zsh-editing-workbench"
zinit load "desyncr/zsh-autocompl"
# Can manage local plugins
zinit load "~/.config/zsh/settings", from:local
zinit load "fnune/base16-shell"
# A relative path is resolved with respect to the $ZPLUG_HOME

export ENHANCD_FILTER=fzf-tmux
