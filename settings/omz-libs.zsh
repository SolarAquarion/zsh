# Local replacements for OMZ libs

# === OMZL::spectrum.zsh ===
# Color constants for use in prompts and output
typeset -AHg FX FG BG

FX=(
    reset     "%{^[[00m%}"
    bold      "%{^[[01m%}" no-bold      "%{^[[22m%}"
    italic    "%{^[[03m%}" no-italic    "%{^[[23m%}"
    underline "%{^[[04m%}" no-underline "%{^[[24m%}"
    blink     "%{^[[05m%}" no-blink     "%{^[[25m%}"
    reverse   "%{^[[07m%}" no-reverse   "%{^[[27m%}"
)

for color in {000..255}; do
    FG[$color]="%{^[[38;5;${color}m%}"
    BG[$color]="%{^[[48;5;${color}m%}"
done

# === OMZL::termsupport.zsh ===
# Set terminal window and tab title
function title() {
    emulate -L zsh
    setopt prompt_subst

    [[ "$EMACS" == *term* ]] && return

    # if $2 is unset use $1 as default
    local title="${2:-$1}"
    if [[ "$TERM" == screen* ]]; then
        print -Pn "\ek$title\e\\"
    elif [[ "$TERM" == xterm* ]] || [[ "$TERM" == rxvt* ]] || [[ "$TERM" == alacritty* ]] || [[ "$TERM" == kitty* ]]; then
        print -Pn "\e]2;$title\a"
    fi
}

ZSH_THEME_TERM_TAB_TITLE_IDLE="%15<..<%~%<<" #15 char left truncated PWD
ZSH_THEME_TERM_TITLE_IDLE="%n@%m: %~"

# Runs before showing the prompt
function omz_termsupport_precmd() {
    [[ "$DISABLE_AUTO_TITLE" == true ]] && return
    title "$ZSH_THEME_TERM_TAB_TITLE_IDLE" "$ZSH_THEME_TERM_TITLE_IDLE"
}

# Runs before executing a command
function omz_termsupport_preexec() {
    [[ "$DISABLE_AUTO_TITLE" == true ]] && return

    emulate -L zsh

    # cmd name only, or if this is sudo or ssh, the next cmd
    local CMD=${1[(wr)^(*=*|sudo|ssh|*-*)]}
    local LINE="${2:gs/%/%%}"

    title "$CMD" "%100>...>${LINE}%<<"
}

autoload -U add-zsh-hook
add-zsh-hook precmd omz_termsupport_precmd
add-zsh-hook preexec omz_termsupport_preexec
