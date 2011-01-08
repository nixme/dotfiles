bindkey -e   # generally use emacs keybindings

# remove '/' from default set of characters that are treated as part of a word,
#   makes backward-delete-word and others more useful with paths
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

# search on up/down arrow if a partial cmd is entered, otherwise browse history
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search

# expand history abbreviations when hitting space
bindkey ' ' magic-space

# bind M-s to prepend 'sudo ' to the current line
# TODO: detect solaris and use 'pfexec' instead of 'sudo'
insert-sudo () {
  BUFFER="sudo $BUFFER"
  CURSOR=$#BUFFER
}
zle -N insert-sudo
bindkey '^[s' insert-sudo
