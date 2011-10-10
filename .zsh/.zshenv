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
  ~/.rbenv/bin               # rbenv binaries
  ~/bin                      # personal scripts and binaries
) if [[ -d $dir ]]; then path=($dir $path); fi

# MANPATH
for dir (
  $homebrew/share/man        # homebrew-installed manpages
) if [[ -d $dir ]]; then manpath=($dir $manpath); fi

# NODE_PATH (not a special zsh parameter, so explicit exports)
for dir (
  $homebrew/lib/node         # homebrew-installed node.js libraries
  $homebrew/lib/node_modules
) if [[ -d $dir ]]; then export NODE_PATH=$dir:$NODE_PATH; fi

# PAGER: use 'most' if available, otherwise fallback to 'less'
most &>/dev/null 2>&1 && export PAGER="most" || export PAGER="less"
export ACK_PAGER=$PAGER      # use paging for ack results

# EDITOR: ??? todo: emacsclient -nw

# load local environment customizations
[[ -r $ZDOTDIR/local-env.zsh ]] && source $ZDOTDIR/local-env.zsh
