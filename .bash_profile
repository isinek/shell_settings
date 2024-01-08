# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# if running bash
if [ -n "$BASH_VERSION" ]; then
	[ -f "$HOME/.bashrc" ] && source "$HOME/.bashrc"
	[ -f "$HOME/.bashrc.user" ] && source "$HOME/.bashrc.user"
	[ -f "$HOME/.bash_aliases" ] && source "$HOME/.bash_aliases"
	[ -f "$HOME/.bash_completion" ] && source "$HOME/.bash_completion"
	[ -f "$HOME/.fzf.bash" ] && source "$HOME/.fzf.bash"
fi

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

