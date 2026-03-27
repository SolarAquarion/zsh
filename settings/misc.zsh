# Miscellaneous zsh options

autoload -Uz add-zle-hook-widget
autoload -Uz edit-command-line

#############################
# ZSH Modules
#############################

zmodload zsh/parameter
zmodload zsh/complist
zmodload zsh/deltochar
zmodload zsh/mathfunc

zmodload -ap zsh/mapfile mapfile
zmodload -a  zsh/stat    zstat
zmodload -a  zsh/zpty    zpty

# Better umask
umask 022

# Colors
autoload -Uz colors && colors

DIRSTACKSIZE=5

setopt BRACE_CCL
setopt COMBINING_CHARS
setopt RC_QUOTES
unsetopt MAIL_WARNING

setopt LONG_LIST_JOBS
setopt AUTO_RESUME
setopt NOTIFY
unsetopt BG_NICE
unsetopt HUP
unsetopt CHECK_JOBS

unsetopt nomatch

# Ignore <C-d> logout
setopt ignore_eof
# Disable beeps
setopt no_beep
# Enable spellcheck
setopt correct
# Enable "=command" feature
setopt equals
# Disable flow control
setopt no_flow_control

# Save time stamp
setopt extended_history
# Better jobs
setopt long_list_jobs
# Enable completion in "--option=arg"
setopt magic_equal_subst
# Add "/" if completes directory
setopt mark_dirs
# Disable menu complete
setopt no_menu_complete
setopt list_rows_first
# Expand globs when completion
setopt glob_complete
# Can search subdirectory in $PATH
setopt path_dirs
# For multi byte
setopt print_eightbit
# Print exit value if return code is non-zero
setopt print_exit_value
# Short statements in for, repeat, select, if, function
setopt short_loops
unsetopt promptcr
setopt hash_cmds
# Enable comment string
setopt interactive_comments
# Improve rm *
setopt rm_star_wait
# Prompt substitution
setopt prompt_subst

setopt auto_list
setopt auto_param_slash
setopt auto_param_keys
# List like "ls -F"
setopt list_types
# Compact completion
setopt list_packed
# Check original command in alias completion
setopt complete_aliases
unsetopt hist_verify
setopt always_last_prompt

# Sort filenames numerically (e.g., file1, file2, file10 instead of file1, file10, file2)
setopt numericglobsort

# Include dotfiles in globbing
setopt glob_dots

# VSCode-like word navigation (treat more chars as word boundaries)
export WORDCHARS='*?[]~=&;!#$%^(){}<>'

# Directory stack
setopt auto_pushd          # cd pushes to directory stack
setopt pushd_ignore_dups   # no duplicate dirs on stack
setopt pushd_silent        # don't print directory stack after pushd/popd
