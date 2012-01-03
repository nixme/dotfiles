HISTFILE=$ZDOTDIR/history    # store history to ~/.zsh/history
HISTSIZE=200000              # Number of lines kept in session history
SAVEHIST=200000              # Number of lines saved in history after logout

setopt extended_history      # Store timestamp and running time of commands
setopt hist_ignore_all_dups  # if a new line is a duplicate, remove the older line
setopt hist_find_no_dups     # Ignore duplicates when searching
setopt hist_ignore_space     # Don't store lines beginning with a space (useful for secrets)
setopt hist_no_store         # Don't store `history` or `fc` command lines
setopt hist_reduce_blanks    # Tidy up whitespace when saving lines
setopt inc_append_history    # add line to history immediately after execution
setopt share_history         # easily share history between concurrent sessions

setopt hist_verify           # don't immediately execute an expanded command
