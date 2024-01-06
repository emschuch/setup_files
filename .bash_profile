#set up color
COLOR_RED="\033[0;31m"
COLOR_YELLOW="\033[0;33m"
COLOR_GREEN="\033[0;32m"
COLOR_OCHRE="\033[38;5;95m"
COLOR_BLUE="\033[0;34m"
COLOR_WHITE="\033[0;37m"
COLOR_RESET="\033[0m"
COLOR_CYAN="\033[0;36m"

function git_color {
  local git_status="$(git status 2> /dev/null)"

  if [[ ! $git_status =~ "working directory clean" ]]; then
    echo -e $COLOR_YELLOW
  elif [[ ! $git_status =~ "Your branch is ahead of" ]]; then
    echo -e $COLOR_OCHRE
  elif [[ ! $git_status =~ "nothing to commit" ]]; then
    echo -e $COLOR_GREEN
  else
    echo -e $COLOR_BLUE
  fi
}

function git_branch {
  local git_status="$(git status 2> /dev/null)"
  local on_branch="On branch ([^${IFS}]*)"
  local on_commit="HEAD detached at ([^${IFS}]*)"

  if [[ $git_status =~ $on_branch ]]; then
    local branch=${BASH_REMATCH[1]}
    echo "($branch)"
  elif [[ $git_status =~ $on_branch ]]; then
    local commit=${BASH_REMATCH[1]}
    echo "($commit)"
  fi
}

PSpink='\n\[\033[0;35m\]\u@\h \w$VENV_NOTICE \[\033[00m\]'

PS1=$PSpink				        # working directory in pink
PS1+="\[$COLOR_CYAN\]\d \t" 	# date and time in cyan
PS1+=" \[\$(get_color)\]"		# color according to git status
PS1+="\$(git_branch)"		    # prints current branch according to status
PS1+="\[$COLOR_RESET\] \n\$ "	# reset to white with new line
export PS1

# easily start a simple local python web server
alias web='python -m SimpleHTTPServer'

# other aliases
alias cl='clear'

# Easily get IPython Notebook started up.
alias ipnb='jupyter notebook'
