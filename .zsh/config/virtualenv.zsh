# virtualenvwrapper to help manage python environments through virtualenv Lazily
# loaded (i.e. no tab completion until first run) since I don't code in python
# much.
if command -v virtualenvwrapper.sh &>/dev/null; then
  export WORKON_HOME=$HOME/.virtualenvs
  export PROJECT_HOME=$HOME/Projects
  export VIRTUALENVWRAPPER_SCRIPT=`which virtualenvwrapper.sh`
  source virtualenvwrapper_lazy.sh
fi
