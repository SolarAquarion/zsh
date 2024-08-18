# Bundles from the default repo (robbyrussell's oh-my-zsh).
zinit load "willghatch/zsh-hooks"
zinit load "zsh-users/zsh-history-substring-search"
zinit wait lucid for "zdharma-continuum/fast-syntax-highlighting"
zinit load "softmoth/zsh-vim-mode"
zinit load "chrissicool/zsh-256color"
zinit load "mollifier/cd-gitroot"
zinit load "Tarrasch/zsh-functional"

zi wait lucid for \
  atinit"ZI[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
     z-shell/F-Sy-H \
  blockf \
     zsh-users/zsh-completions \
  atload"!_zsh_autosuggest_start" \
     zsh-users/zsh-autosuggestions

zinit ice lucid nocompile wait'0e' nocompletions
zinit load MenkeTechnologies/zsh-more-completions

zi wait lucid for \
  z-shell/zsh-fancy-completions


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
zinit snippet OMZP::common-aliases
zinit snippet OMZP::zsh-interactive-cd
zinit load "hlissner/zsh-autopair"
zinit load "psprint/zsh-navigation-tools"
zinit load "psprint/zsh-editing-workbench"
zinit load "desyncr/zsh-autocompl"
zinit load "fnune/base16-shell"
zinit load "zdharma-continuum/zsh-navigation-tools"

zinit ice lucid as"program" pick"bin/git-dsf"
zinit load so-fancy/diff-so-fancy

zinit is-snippet for ~/.config/zsh/settings/alias.zsh
zinit is-snippet for ~/.config/zsh/settings/autosuggest.zsh
zinit is-snippet for ~/.config/zsh/settings/bzr.zsh
zinit is-snippet for ~/.config/zsh/settings/completion.zsh
zinit is-snippet for ~/.config/zsh/settings/grep.zsh
zinit is-snippet for ~/.config/zsh/settings/misc.zsh
zinit is-snippet for ~/.config/zsh/settings/environment.zsh
zinit is-snippet for ~/.config/zsh/settings/git.zsh
zinit is-snippet for ~/.config/zsh/settings/paths.zsh
zinit is-snippet for ~/.config/zsh/settings/correction.zsh
zinit is-snippet for ~/.config/zsh/settings/export.zsh
zinit is-snippet for ~/.config/zsh/settings/substring.zsh
zinit is-snippet for ~/.config/zsh/settings/history.zsh
zinit is-snippet for ~/.config/zsh/settings/functions.zsh
zinit is-snippet for ~/.config/zsh/settings/directory.zsh
zinit is-snippet for ~/.config/zsh/settings/clipboard.zsh
zinit is-snippet for ~/.config/zsh/settings/secrets.zsh
# A relative path is resolved with respect to the $ZPLUG_HOME

export ENHANCD_FILTER=fzf-tmux
