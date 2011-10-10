# load rvm to manage paths for multiple rubies and gemsets
if [[ -s "$HOME/.rvm/scripts/rvm" ]]; then         # prefer a user rvm install
  source "$HOME/.rvm/scripts/rvm"
elif [[ -s "/usr/local/rvm/scripts/rvm" ]]; then   # otherwise, use system-wide
  source "/usr/local/rvm/scripts/rvm"
fi

# rbenv: Initialize if installed
if command -v rbenv &>/dev/null; then
  eval "$(rbenv init -)"
fi
