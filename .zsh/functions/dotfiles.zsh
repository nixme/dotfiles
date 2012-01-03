# Functions for managing dotfiles and the repo.
#
# Having the dotfiles repo at $HOME/.git would mean a git command outside of
# another git repository would act on the dotfiles repo. For example,
# `git clean -fx` would delete almost everything in $HOME.
#
# So to hide the dotfiles repo from git, ~/.git should be moved to
# ~/.dotfiles/.git using `dfsetup` after cloning. Then use `dfgit` to run actual
# git commands against the dotfiles repo.
#


# Sets up this dotfiles installation. Specifically moves ~/.git to ~/.dotfiles/.git.
dfsetup() {
  if [[ -d ~/.git ]]; then
    mv ~/.git ~/.dotfiles
    echo "Done. Restart the shell."
  else
    echo "Already set up."
  fi
}

# Safer git operations for the dotfiles repo.
dfgit() {
  if [[ $1 =~ clean ]]; then
    echo "clean is not allowed on the dotfiles repo"
  else
    GIT_DIR=~/.dotfiles/.git GIT_WORK_TREE=~/ git $@
  fi
}
