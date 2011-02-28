# load virtualenvwrapper to help manage python environments
if command -v virtualenvwrapper.sh &>/dev/null; then
  export WORKON_HOME=$HOME/.virtualenvs
  source virtualenvwrapper.sh
fi
