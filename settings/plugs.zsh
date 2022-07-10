# Bundles from the default repo (robbyrussell's oh-my-zsh).
zinit load "zsh-users/zsh-completions"
zinit load "willghatch/zsh-hooks"
zinit load "zsh-users/zsh-history-substring-search"
zinit load "zsh-users/zsh-completions"
zinit load "zdharma/fast-syntax-highlighting"

zinit load "softmoth/zsh-vim-mode"
zinit load "chrissicool/zsh-256color"
zinit load "mollifier/cd-gitroot"
zinit load "Tarrasch/zsh-functional"
zinit load "zsh-users/zsh-autosuggestions"
zinit ice proto'git' pick'init.sh'
zinit light "b4b4r07/enhancd"
zinit load "supercrabtree/k"
# # Syntax highlighting bundle.
zinit load "mafredri/zsh-async"
# # Load the theme.
zinit ice load depth=1
zinit light "romkatv/powerlevel10k"
zinit load "RobSis/zsh-completion-generator"
zinit load "fcambus/ansiweather"
zinit load "arzzen/calc.plugin.zsh"
# Supports oh-my-zsh plugins and the like
zinit snippet OMZP::command-not-found
zinit load "hlissner/zsh-autopair"
zinit load "psprint/zsh-navigation-tools"
zinit load "psprint/zsh-editing-workbench"
zinit load "desyncr/zsh-autocompl"
# Can manage local plugins
zinit load "fnune/base16-shell"
# A relative path is resolved with respect to the $ZPLUG_HOME

export ENHANCD_FILTER=fzf-tmux
