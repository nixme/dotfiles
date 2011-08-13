zmodload -i zsh/complist        # load completion listing extensions
autoload -U compinit; compinit  # initialize completion system
autoload -U zmv                 # load zmv for globbing mv alternative
setopt extended_glob            # treat #, ~, and ^ as globbing patterns
setopt numeric_glob_sort        # numerically sort numeric filename matches
setopt complete_in_word         # keep cursor position during completion
setopt always_to_end            # move cursor to end of word after completion

# match first by all letters case-insensitively, then partial-word, then substring
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# use menu on second tab-press
zstyle ':completion:*:*:*:*:*' menu select

# nicer formatting of matches
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format 'No matches for: %B%d%b'

# turn on caching; saves to $ZDOTDIR/.zcompcache by default
zstyle ':completion::complete:*' use-cache yes

# show all user processes when completing processes tag
# TODO: check if this works properly on linux boxes
zstyle ':completion:*:*:*:*:processes' command "ps -u `whoami` -o pid,user,comm -w -w"
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
