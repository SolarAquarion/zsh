# Local and third-party plugins (formerly oh-my-zsh plugins, now local)
zinit is-snippet for ~/.config/zsh/settings/alias.zsh

zinit is-snippet for ~/.config/zsh/settings/completion.zsh
zinit is-snippet for ~/.config/zsh/settings/grep.zsh
zinit is-snippet for ~/.config/zsh/settings/misc.zsh
zinit is-snippet for ~/.config/zsh/settings/environment.zsh
zinit is-snippet for ~/.config/zsh/settings/git.zsh
zinit is-snippet for ~/.config/zsh/settings/paths.zsh
zinit is-snippet for ~/.config/zsh/settings/correction.zsh
zinit is-snippet for ~/.config/zsh/settings/export.zsh

zinit is-snippet for ~/.config/zsh/settings/history.zsh
zinit is-snippet for ~/.config/zsh/settings/functions.zsh
zinit is-snippet for ~/.config/zsh/settings/directory.zsh
zinit is-snippet for ~/.config/zsh/plugins/clipboard.zsh
zinit is-snippet for ~/.config/zsh/settings/secrets.zsh
zinit is-snippet for ~/.config/zsh/settings/openclaw.zsh
zinit is-snippet for ~/.config/zsh/settings/fzf-functions.zsh
zinit is-snippet for ~/.config/zsh/settings/apply-env.zsh
zinit is-snippet for ~/.config/zsh/settings/zpwr-utils.zsh

zinit load "willghatch/zsh-hooks"

zinit load "larkery/zsh-histdb"
zinit load "tru2dagame/zsh-history-substring-search-histdb"
zinit is-snippet for ~/.config/zsh/settings/substring.zsh

zinit load "softmoth/zsh-vim-mode"
zinit load "chrissicool/zsh-256color"
zinit load "mollifier/cd-gitroot"
zinit load "Tarrasch/zsh-functional"

zinit ice nocompletions atinit'setopt interactivecomments'
zinit ice eval'zstyle -L ":completion:*" completer | sed "s/_expand //"'
zinit light marlonrichert/zsh-autocomplete

zinit ice wait lucid snippet for ~/.config/zsh/settings/bindkey.zsh
zinit wait lucid for \
  atinit"ZI[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
     z-shell/F-Sy-H \
  blockf \
     zsh-users/zsh-completions

zinit wait lucid for \
  atload"!_zsh_autosuggest_start" \
     zsh-users/zsh-autosuggestions
     
zinit is-snippet for ~/.config/zsh/settings/autosuggest.zsh

zinit ice lucid nocompile wait'0e' nocompletions
zinit load MenkeTechnologies/zsh-more-completions

zinit ice lucid nocompletions
zinit load z-shell/zsh-fancy-completions

zinit light Aloxaf/fzf-tab


zi ice as'null' from"gh-r" sbin
zi light ajeetdsouza/zoxide

zi has'zoxide' wait lucid for \
  z-shell/zsh-zoxide

zi wait lucid for \
  has'eza' atinit'AUTOCD=1' \
    z-shell/zsh-eza

zinit ice wait'!0'
zinit light "b4b4r07/enhancd"
zinit load "supercrabtree/k"
zinit load "mafredri/zsh-async"
zinit ice load depth=1
zinit light "romkatv/powerlevel10k"
zinit load "RobSis/zsh-completion-generator"
zinit load "fcambus/ansiweather"
zinit load "arzzen/calc.plugin.zsh"
# Local OMZ replacements (formerly plugins + libs)
zinit is-snippet for ~/.config/zsh/settings/omz-local.zsh
zinit is-snippet for ~/.config/zsh/settings/omz-libs.zsh

zinit load "hlissner/zsh-autopair"
zinit load "psprint/zsh-editing-workbench"
zinit load "fnune/base16-shell"
zinit load "zdharma-continuum/zsh-navigation-tools"
zinit load oz/safe-paste
zinit load wfxr/forgit

zinit ice as"program" pick"bin/git-fuzzy"
zinit light bigH/git-fuzzy
zinit light CraigCarey/gstreamer-tab
zinit ice lucid as"program" pick"bin/git-dsf"
zinit load so-fancy/diff-so-fancy
