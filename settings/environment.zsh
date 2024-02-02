
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
# awesome cd movements from zshkit
setopt autocd autopushd pushdminus pushdsilent pushdtohome cdablevars
DIRSTACKSIZE=5

setopt BRACE_CCL          # Allow brace character class list expansion.
setopt COMBINING_CHARS    # Combine zero-length punctuation characters (accents)
                          # with the base character.
setopt RC_QUOTES          # Allow 'Henry''s Garage' instead of 'Henry'\''s Garage'.
unsetopt MAIL_WARNING     # Don't print a warning message if a mail file has been accessed.

setopt LONG_LIST_JOBS     # List jobs in the long format by default.
setopt AUTO_RESUME        # Attempt to resume existing job before creating a new process.
setopt NOTIFY             # Report status of background jobs immediately.
unsetopt BG_NICE          # Don't run all background jobs at a lower priority.
unsetopt HUP              # Don't kill jobs on shell exit.
unsetopt CHECK_JOBS       # Don't report on jobs when shell exit.
setopt extendedglob
unsetopt nomatch
setopt auto_resume
# Ignore <C-d> logout
setopt ignore_eof
# # Disable beeps
 setopt no_beep
# # Enable spellcheck
setopt correct
# # Enable "=command" feature
 setopt equals
# # Disable flow control
 setopt no_flow_control

# # Save time stamp
 setopt extended_history
# # Better jobs
 setopt long_list_jobs
# # Enable completion in "--option=arg"
 setopt magic_equal_subst
# # Add "/" if completes directory
 setopt mark_dirs
# # Disable menu complete for vimshell
 setopt no_menu_complete
 setopt list_rows_first
# # Expand globs when completion
 setopt glob_complete
# # Enable multi io redirection
 setopt multios
# # Can search subdirectory in $PATH
 setopt path_dirs
# # For multi byte
 setopt print_eightbit
# # Print exit value if return code is non-zero
 setopt print_exit_value
 setopt pushd_ignore_dups
 setopt pushd_silent
# # Short statements in for, repeat, select, if, function
 setopt short_loops
# setopt transient_rprompt
 unsetopt promptcr
 setopt hash_cmds
# setopt numeric_glob_sort
 # Enable comment string
 setopt interactive_comments
# # Improve rm *
 setopt rm_star_wait
# # Enable extended glob
 setopt extended_glob
# # Note: It is a lot of errors in script
# # setopt no_unset
# # Prompt substitution
 setopt prompt_subst
 if [[ ${VIMSHELL_TERM:-""} != ""  ]]; then
     setopt no_always_last_prompt
     else
         setopt always_last_prompt
         fi
         # List completion
         setopt auto_list
         setopt auto_param_slash
         setopt auto_param_keys
         # List like "ls -F"
         setopt list_types
         # Compact completion
         setopt list_packed
         setopt auto_cd
         setopt auto_pushd
         setopt pushd_minus
         setopt pushd_ignore_dups
#         # Check original command in alias completion
         setopt complete_aliases
         unsetopt hist_verify
