HISTFILE=$ZDOTDIR/history    # store history to ~/.zsh/history
HISTSIZE=10000               # number of lines kept in session history
SAVEHIST=10000               # number of lines saved in history after logout

setopt hist_ignore_all_dups  # if a new line is a duplicate, remove the older line
setopt hist_ignore_space     # ignore lines that begin with a space (useful for secrets)
setopt inc_append_history    # add line to history immediately after execution
setopt share_history         # easily share history between concurrent sessions

setopt hist_verify           # don't immediately execute an expanded command
