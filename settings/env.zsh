# Validate temporary directory
if [[ -z "$TMPDIR" ]]; then
	TMPDIR="$(dirname $(mktemp -ut tmp.XXXXXXXXXX))/"
	user_tmpdir="$TMPDIR$UID"
	mkdir -p "$user_tmpdir" >/dev/null 2>&1
	if [[ -w "$user_tmpdir" ]]; then
		TMPDIR="$user_tmpdir/"
		chmod 0700 "$TMPDIR"
	fi
	echo "WARNING: \"TMPDIR\" is not set, using \"$TMPDIR\" as default!" >&2
	unset user_tmpdir
fi
if [[ ! -w "$TMPDIR" ]]; then
	echo "WARNING: Temporary directory \"$TMPDIR\" is not writable!" >&2
fi

# Setup XDG cache directory
if [[ -z "$XDG_CACHE_HOME" ]]; then
	XDG_CACHE_HOME="$LOCAL_HOME/.cache"
fi
if [[ ! -d "$XDG_CACHE_HOME" ]]; then
	mkdir -p "$XDG_CACHE_HOME"
	chmod 0700 "$XDG_CACHE_HOME"
fi
export XDG_CACHE_HOME

# Setup XDG runtime directory
if [[ -z "$XDG_RUNTIME_DIR" ]]; then
	XDG_RUNTIME_DIR="$TMPDIR/runtime-dir.$UID"
fi
if [[ ! -d "$XDG_RUNTIME_DIR" ]]; then
	mkdir -p "$XDG_RUNTIME_DIR"
	chmod 0700 "$XDG_RUNTIME_DIR"
fi
export XDG_RUNTIME_DIR

if [[ -z "XDG_STATE_HOME" ]] ; then
   XDG_STATE_HOME="$HOME/.local/state"
fi
if [[ ! -d "$XDG_STATE_HOME" ]] ; then
  mkdir -p "$XDG_STATE_HOME"
	chmod 0700 "$XDG_STATE_HOME"
fi
export XDG_STATE_HOME

# Setup ZSH cache directory
if [[ -z "$ZSH_CACHE_DIR" ]]; then
	ZSH_CACHE_DIR="$XDG_CACHE_HOME/zsh"
fi
if [[ ! -d "$ZSH_CACHE_DIR" ]]; then
	mkdir -p "$ZSH_CACHE_DIR"
	chmod 0700 "$ZSH_CACHE_DIR"
fi
export ZSH_CACHE_DIR

#Setup ZSH state directory
if [[ -z "$ZSH_HISTORY_DIR" ]]; then
  ZSH_HISTORY_DIR="$XDG_STATE_HOME/zsh"
fi
if [[ ! -d "$ZSH_HISTORY_DIR" ]]; then
	mkdir -p "$ZSH_HISTORY_DIR" 
	chmod 0700 "$ZSH_HISTORY_DIR"
fi
export ZSH_HISTORY_DIR
