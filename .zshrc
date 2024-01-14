# set up shell colors
autoload -U colors && colors

# set up git branch status
autoload -Uz compinit && compinit
autoload -Uz add-zsh-hook
autoload -Uz vcs_info

add-zsh-hook precmd vcs_info
setopt prompt_subst

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' formats "%F{blue}%c%u(%b)%f"
zstyle ':vcs_info:*' actionformats "%F{blue}%c%u(%b)%f %a"
zstyle ':vcs_info:*' stagedstr "%F{green}"
zstyle ':vcs_info:*' unstagedstr "%F{red}"
zstyle ':vcs_info:*' check-for-changes true

zstyle ':vcs_info:git*+set-message:*' hooks git-untracked

+vi-git-untracked() {
  if git --no-optional-locks status --porcelain 2> /dev/null | grep -q "^??"; then
    hook_com[staged]+="%F{red}"
  fi
}

NEWLINE=$'\n'
BRANCH='$vcs_info_msg_0_'

PS1="${NEWLINE}"					                    # start with a new line
PS1+="%{$fg[magenta]%}%n:"				                # username and machine in pink
PS1+=" %{$fg[cyan]%}%D{%a %b %d %Y} %{$fg[cyan]%}%*"	# date and time in cyan
PS1+=" %{$fg[yellow]%}%(5~|%-1~/.../%3~|%4~)"	    	# directory path in yellow
PS1+=" %{$reset_color%}${BRANCH}"		            	# display and color git branch
PS1+="${NEWLINE}%{$reset_color%}%\> "			        # new line for prompt reset to white

export PS1

# easily start a simple local python web server
alias web='python -m SimpleHTTPServer'

# other aliases
alias cl='clear'
alias gs='git status'
alias gd='git diff'
alias jup='jupyter notebook'
alias jupl='jupyter lab'

# set up shell environment for pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

eval "$(pyenv virtualenv-init -)"
