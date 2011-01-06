bindkey -e   # generally use emacs keybindings

# search on up/down arrow if a partial cmd is entered, otherwise browse history
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search

# expand history abbreviations when hitting space
bindkey ' ' magic-space
