# general unix environment variables
export LC_CTYPE="en_US.UTF-8"

# paths: PATH, MANPATH, NODE_PATH
#   for cross-machine compatibility, iterate through all possible
#   paths and only add ones that exist

# prefer user homebrew directory if installed
[[ -d ~/.homebrew ]] && homebrew=~/.homebrew || homebrew=/usr/local

# PATH
for dir (
  $homebrew/sbin             # homebrew-installed system binaries
  $homebrew/bin              # homebrew-installed user binaries
  $homebrew/share/npm/bin    # node.js npm binaries
  ~/bin                      # personal scripts and binaries
) if [[ -d $dir ]]; then path=($dir $path); fi

# MANPATH
for dir (
  $homebrew/share/man        # homebrew-installed manpages
) if [[ -d $dir ]]; then manpath=($dir $manpath); fi

# NODE_PATH
for dir (
  $homebrew/lib/node         # homebrew-installed node.js libraries
) if [[ -d $dir ]]; then node_path=($dir $node_path); fi
export NODE_PATH=$node_path  # not a special zsh parameter, so explicit export

# PAGER: use 'most' if available, otherwise fallback to 'less'
most &>/dev/null 2>&1 && export PAGER="most" || export PAGER="less"
export ACK_PAGER=$PAGER      # use paging for ack results

# EDITOR: ??? todo: emacsclient -nw

# load local environment customizations
[[ -r $ZDOTDIR/local-env.zsh ]] && source $ZDOTDIR/local-env.zsh
