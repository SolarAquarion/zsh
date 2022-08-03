# Bundles from the default repo (robbyrussell's oh-my-zsh).
zinit ice wait'!0'
zinit ice "zsh-users/zsh-completions"
zinit load "willghatch/zsh-hooks"
zinit load "zsh-users/zsh-history-substring-search"
zinit load "zdharma-continuum/fast-syntax-highlighting"
zinit load "softmoth/zsh-vim-mode"
zinit load "chrissicool/zsh-256color"
zinit load "mollifier/cd-gitroot"
zinit load "Tarrasch/zsh-functional"
zinit load "zsh-users/zsh-autosuggestions"
zinit ice wait'!0'
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
zinit snippet OMZP::ssh-agent
zinit snippet OMZP::common-aliases
zinit snippet OMZP::zsh-interactive-cd
zinit load "hlissner/zsh-autopair"
zinit load "psprint/zsh-navigation-tools"
zinit load "psprint/zsh-editing-workbench"
zinit load "desyncr/zsh-autocompl"
zinit load "fnune/base16-shell"
zinit load "zdharma-continuum/zsh-navigation-tools"
# A relative path is resolved with respect to the $ZPLUG_HOME

export ENHANCD_FILTER=fzf-tmux
