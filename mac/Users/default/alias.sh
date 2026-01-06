# Handle 'lsd' substitute for 'ls'
if command -v lsd &> /dev/null; then
    alias ls='lsd --color=auto'
    alias ll='lsd -alhFv --group-directories-first'
else
    alias ls='ls -G'
    alias ll='ls -alfh'
fi

alias grep='grep --color=auto'

# Handle 'nvim' substitute for 'vim'
if command -v nvim &> /dev/null; then
    alias vi='nvim'
    alias vim='nvim'
else
    alias vi='vim'
fi

if command -v terraform &> /dev/null; then
    alias tf='terraform'
fi
