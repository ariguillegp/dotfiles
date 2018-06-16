alias vim='vim -O'
alias vi='vim'

alias ll='ls -ahlF'
alias la='ls -A'
alias l='ls -CF'
alias ld='ls -ld'

alias ..='cd ..'
alias ..2='cd ../..'
alias ..3='cd ../../..'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
