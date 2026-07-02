# Only apply these settings in interactive shells
case $- in
    *i*) ;;
    *) return ;;
esac

# History
HISTSIZE=1000
HISTFILESIZE=1000
HISTCONTROL=ignoredups
# Append to the history file instead of overwriting it
shopt -s histappend
# Save each command immediately and reload commands from other sessions
PROMPT_COMMAND='history -a; history -n'
# Ignore commands starting with a space and consecutive duplicates
HISTCONTROL=ignoreboth
# Don't save these trivial commands
HISTIGNORE='ls:ll:pwd:exit:clear:history'
# Search history by the current command prefix with Up/Down arrows
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# Default editor
export EDITOR=vim

# Enable colored output if supported
if command -v tput >/dev/null 2>&1 && [ "$(tput colors 2>/dev/null || echo 0)" -ge 8 ]; then
    RED='\[\e[31m\]'
    RESET='\[\e[0m\]'
    PS1="${RED}\u@\h${RESET}:\w${RED}\$${RESET} "

    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
else
    PS1='\u@\h:\w\$ '
fi

# Check window size after each command
shopt -s checkwinsize

# Aliases
alias ll='ls -lash'
alias l='ls -1'
alias la='ls -1a'
alias ..='cd ..'
alias ...='cd ../..'


# Path
export PATH="$HOME/.local/bin:$HOME/bin:$PATH"

