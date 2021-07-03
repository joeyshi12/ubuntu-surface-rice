alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias v='vim'
alias sv='sudo -E vim'
alias r='ranger'
# Add an "alert" alias for long running commands.
# example: sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
