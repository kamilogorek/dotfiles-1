# Colors vary depending on time lapsed.
ZSH_THEME_GIT_TIME_SINCE_COMMIT_SHORT="%{$fg[green]%}"
ZSH_THEME_GIT_TIME_SHORT_COMMIT_MEDIUM="%{$fg[yellow]%}"
ZSH_THEME_GIT_TIME_SINCE_COMMIT_LONG="%{$fg[red]%}"
ZSH_THEME_GIT_TIME_SINCE_COMMIT_NEUTRAL="%{$fg[cyan]%}"

#Customized git status, oh-my-zsh currently does not allow render dirty status before branch
git_custom_status() {
  local cb=$(current_branch)
  if [ -n "$cb" ]; then
    echo "$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_PREFIX$(current_branch)$ZSH_THEME_GIT_PROMPT_SUFFIX"
  fi
}


setopt APPEND_HISTORY
# setopt AUTO_LIST		# these two should be turned off
unsetopt BG_NICE		# do NOT nice bg commands
setopt CORRECT			# command CORRECTION
setopt EXTENDED_HISTORY		# puts timestamps in the history
setopt HIST_ALLOW_CLOBBER
setopt HIST_REDUCE_BLANKS
setopt INC_APPEND_HISTORY SHARE_HISTORY
setopt ALL_EXPORT

# setopt MENUCOMPLETE
# Set/unset  shell options
# setopt   notify globdots correct pushdtohome cdablevars autolist
# setopt   correctall autocd recexact longlistjobs
# setopt   autoresume histignoredups pushdsilent noclobber
# setopt   autopushd pushdminus extendedglob rcquotes mailwarning
# unsetopt bgnice autoparamslash


source ~/.zsh/git-prompt/zshrc.sh

# an example prompt
PATH="/usr/local/share/npm/bin:/opt/local/bin:/opt/local/sbin:/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:$PATH"
TZ="Europe/London"
HISTFILE=$HOME/.zhistory
HISTSIZE=9999
SAVEHIST=9999
HOSTNAME="`hostname`"
PAGER='less'
    autoload colors zsh/terminfo
    if [[ "$terminfo[colors]" -ge 8 ]]; then
   colors
    fi
    for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE; do
   eval PR_$color='%{$terminfo[bold]$fg[${(L)color}]%}'
   eval PR_LIGHT_$color='%{$fg[${(L)color}]%}'
   (( count = $count + 1 ))
    done
    PR_NO_COLOR="%{$terminfo[sgr0]%}"
RPS1=""
PROMPT='$PR_RED%3c$PR_NO_COLOR $(git_super_status)
→ '
#LANGUAGE=
LC_ALL='en_US.UTF-8'
LANG='en_US.UTF-8'
LC_CTYPE=C
DISPLAY=:0

unsetopt ALL_EXPORT

# load in aliases
source $HOME/dotfiles/zsh/aliases

# load in some functions
source $HOME/dotfiles/zsh/functions


# autoload -U compinit
# compinit
bindkey '^I' complete-word # complete on tab, leave expansion to _expand


# because bundle exec is loads of characters

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

GIT_MERGE_AUTOEDIT=no
export GIT_MERGE_AUTOEDIT

# for the Z plugin https://github.com/rupa/z
. /usr/local/Cellar/z/1.4/etc/profile.d/z.sh

export EDITOR='mvim -v'
# But still use emacs-style zsh bindings
bindkey -e
