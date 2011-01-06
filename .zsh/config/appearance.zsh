setopt long_list_jobs            # list jobs in long format
setopt prompt_subst              # allow variable substitutions in the prompt
setopt print_exit_value          # print non-zero exit values
autoload -Uz colors; colors      # color functions so ansi codes are unnecessary
autoload -Uz vcs_info; vcs_info  # version control info functions

# enable colors for ls; find the right OS-dependent option
ls --color -d . &>/dev/null 2>&1 &&
  alias ls='ls --color=tty' ||   # GNU
  alias ls='ls -G'               # BSD

# use grc (if available) to colorize common commands (ping, diff, etc.)
if brew list grc > /dev/null 2>&1; then       # grc installed via homebrew
  source "`brew --prefix grc`/etc/grc.bashrc"
fi  # TODO: add detection for grc on arch, ubuntu, generic, etc.

# prompt styling
() {
  local rc="%{$reset_color%}"                 # variable for easy color reset
  local machine="%{$fg_no_bold[green]%}%m$rc" # machine hostname
  local caret="%{$fg_bold[red]%}»$rc  "       # separates entry from prompt

  # display root user in bold red, regular usernames in bold green
  local user="%(!.%{$fg_bold[red]%}.%{$fg_bold[green]%})%n$rc@"

  # version control and current path styling:
  #   directories under version control are displayed in bold yellow
  local name="%{$fg_no_bold[magenta]%}%s:"    # vcs: branch, unstaged, staged
  local branch="$name%{$fg_bold[white]%}%b%u%c$rc"
  local vcs_path="%{$fg_no_bold[blue]%}%R%{$fg_bold[yellow]%}/%S$rc"
  no_vcs_path="%{$fg_no_bold[blue]%}%~$rc"    # path styling for non vc'ed dirs
  zstyle ':vcs_info:*:prompt:*' check-for-changes true   # git index's status
  zstyle ':vcs_info:*:prompt:*' unstagedstr   "%{$fg_bold[red]%}*"
  zstyle ':vcs_info:*:prompt:*' stagedstr     "%{$fg_bold[green]%}*"
  # branch info goes in msg 0, current path in msg 1, and repo dir in msg 2
  zstyle ':vcs_info:*:prompt:*' actionformats "$branch(%a)" $vcs_path '%R'
  zstyle ':vcs_info:*:prompt:*' formats       "$branch"     $vcs_path '%R'
  zstyle ':vcs_info:*:prompt:*' nvcsformats   ""            $no_vcs_path

  function precmd {
    vcs_info 'prompt'   # namespace vcs_info styling, matches the zstyles above

    # vcs_info's disable-patterns also disables nvcsformats, breaking the styled
    #   paths. so instead the following is used to ignore the dotfiles repo.
    if [[ $HOME -ef $vcs_info_msg_2_ ]]; then
      prompt_path=$no_vcs_path
      prompt_vcs=''
    else
      prompt_path="${${vcs_info_msg_1_%%.}/$HOME/~}"
      prompt_vcs=$vcs_info_msg_0_
    fi
  }

  # rvm info if rvm is active
  function prompt_rvm {
    local rvm_info=$($rvm_path/bin/rvm-prompt i v g 2> /dev/null)
    [[ -n $rvm_info ]] &&
      echo "%{$fg_no_bold[magenta]%}rvm:%{$fg_bold[white]%}$rvm_info$rc"
  }

  PROMPT="[$user$machine] \$prompt_path $caret"
  PROMPT2="  %U%_%u $caret"                   # indent secondary lines
  RPROMPT="\$(prompt_rvm) \$prompt_vcs"       # show rvm and vcs info on right
}
