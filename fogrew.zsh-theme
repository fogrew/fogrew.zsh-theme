#!/usr/bin/env zsh
# fogrew.zsh-theme

# ------------------------------------------------------------------------------
# Prompt for the Zsh shell:
#   * One line.
#   * VCS info on the right prompt.
#   * Only shows the path on the left prompt by default.
#   * Crops the path to a defined length and only shows the path relative to
#     the current VCS repository root.
#   * Wears a different color wether the last command succeeded/failed.
#   * Shows user@hostname if connected through SSH.
#   * Shows if logged in as root or not.
# ------------------------------------------------------------------------------

# More symbols to choose from:
# ☀ ✹ ☄ ♆ ♀ ♁ ♐ ♇ ♈ ♉ ♚ ♛ ♜ ♝ ♞ ♟ ♠ ♣ ⚢ ⚲ ⚳ ⚴ ⚥ ⚤ ⚦ ⚒ ⚑ ⚐ ♺ ♻ ♼ ☰ ☱ ☲ ☳ ☴ ☵ ☶ ☷
# ✡ ✔ ✖ ✚ ✱ ✤ ✦ ❤ ➜ ➟ ➼ ✂ ✎ ✐ ⨀ ⨁ ⨂ ⨍ ⨎ ⨏ ⨷ ⩚ ⩛ ⩡ ⩱ ⩲ ⩵  ⩶ ⨠ 
# ⬅ ⬆ ⬇ ⬈ ⬉ ⬊ ⬋ ⬒ ⬓ ⬔ ⬕ ⬖ ⬗ ⬘ ⬙ ⬟  ⬤ 〒 ǀ ǁ ǂ ĭ Ť Ŧ

# A Powerline-inspired theme for ZSH

# In order for this theme to render correctly, you will need a
# [Powerline-patched font](https://github.com/Lokaltog/powerline-fonts).


# ========================== COLORS =======================#

# If you want to customize the colors, have a look at this handy
# [Graphical overview of the Ansi 256 color codes](http://www.calmar.ws/vim/color-output.png)

#use extended color palette if available
if [[ $TERM = *256color* || $TERM = *rxvt* ]]; then
    local PR_RED="%F{124}"
    local PR_GREEN="%F{34}"
    local PR_BLUE="%{$fg[33]%}"
    local PR_YELLOW="%F{214}"
    local PR_GRAY="%F{8}"
else
    local PR_RED="$fg[124]"
    local PR_GREEN="$fg[34]"
    local PR_BLUE="$fg[33]"
    local PR_YELLOW="$fg[214]"
    local PR_GRAY="$fg[8]"
fi

local PR_RESET="%{$reset_color%}"

local CURRENT_BG="NONE"
local PRIMARY_FG=black

LSCOLORS="Gxfxcxdxbxegedabagacad"
LS_COLORS='no=00:fi=00:di=01;34:ln=00;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=41;33;01:ex=00;32:*.cmd=00;32:*.exe=01;32:*.com=01;32:*.bat=01;32:*.btm=01;32:*.dll=01;32:*.tar=00;31:*.tbz=00;31:*.tgz=00;31:*.rpm=00;31:*.deb=00;31:*.arj=00;31:*.taz=00;31:*.lzh=00;31:*.lzma=00;31:*.zip=00;31:*.zoo=00;31:*.z=00;31:*.Z=00;31:*.gz=00;31:*.bz2=00;31:*.tb2=00;31:*.tz2=00;31:*.tbz2=00;31:*.avi=01;35:*.bmp=01;35:*.fli=01;35:*.gif=01;35:*.jpg=01;35:*.jpeg=01;35:*.mng=01;35:*.mov=01;35:*.mpg=01;35:*.pcx=01;35:*.pbm=01;35:*.pgm=01;35:*.png=01;35:*.ppm=01;35:*.tga=01;35:*.tif=01;35:*.xbm=01;35:*.xpm=01;35:*.dl=01;35:*.gl=01;35:*.wmv=01;35:*.aiff=00;32:*.au=00;32:*.mid=00;32:*.mp3=00;32:*.ogg=00;32:*.voc=00;32:*.wav=00;32:'

# ====== COMMAND COLORS ====== #

VCS_DIRTY_COLOR="${PR_RESET}${PR_YELLOW}"
VCS_CLEAN_COLOR="${PR_RESET}${PR_GREEN}"
VCS_SUFIX_COLOR="${PR_RESET}${PR_RED}"

# ====== SHORTCUTS ====== #

local SEGMENT_SEPARATOR=''
local PLUSMINUS="\u00b1"
local BRANCH="\ue0a0"
local DETACHED="\u27a6"
local CROSS="\u2718"
local LIGHTNING="\u26a1"
local GEAR="\u2699"

local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"

# ====== PREDEFINE ====== #

### NVM
ZSH_THEME_NVM_PROMPT_PREFIX="%B⬡%b "
ZSH_THEME_NVM_PROMPT_SUFFIX=""

### CSV
ZSH_PROMPT_BASE_COLOR="%{$fg_bold[blue]%}"
ZSH_THEME_REPO_NAME_COLOR="%{$fg_bold[red]%}"

# Format for git_prompt_info()
ZSH_THEME_GIT_PROMPT_PREFIX="${PR_RESET}${PR_GRAY}(git: "
ZSH_THEME_GIT_PROMPT_SUFFIX=")${PR_RESET}"

# Format for parse_git_dirty()
ZSH_THEME_GIT_PROMPT_DIRTY="${VCS_DIRTY_COLOR} ✘${PR_RESET}"
ZSH_THEME_GIT_PROMPT_CLEAN="${VCS_CLEAN_COLOR} ✔${PR_RESET}"

# Format for git_prompt_status()
ZSH_THEME_GIT_PROMPT_ADDED="${PR_RESET}${PR_YELLOW} ✚${PR_RESET}"
ZSH_THEME_GIT_PROMPT_MODIFIED="${PR_RESET}${PR_YELLOW} ✹${PR_RESET}"
ZSH_THEME_GIT_PROMPT_DELETED="${PR_RESET}${PR_YELLOW} ✖${PR_RESET}"
ZSH_THEME_GIT_PROMPT_RENAMED="${PR_RESET}${PR_YELLOW} ➜${PR_RESET}"
ZSH_THEME_GIT_PROMPT_UNMERGED="${PR_RESET}${PR_YELLOW} ═${PR_RESET}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="${PR_RESET}${PR_YELLOW} ✭${PR_RESET}"

# Format for git_prompt_ahead()
ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE="%{$fg[cyan]%} ▴"
ZSH_THEME_GIT_PROMPT_BEHIND_REMOTE="%{$fg[magenta]%} ▾"
ZSH_THEME_GIT_PROMPT_DIVERGED_REMOTE="%{$fg[red]%} ↕"

# Format for git_prompt_long_sha() and git_prompt_short_sha()
# ZSH_THEME_GIT_PROMPT_SHA_BEFORE=" %{$WHITE%}[%{$YELLOW%}"
# ZSH_THEME_GIT_PROMPT_SHA_AFTER="%{$WHITE%}]"

# Colors vary depending on time lapsed.
ZSH_THEME_GIT_TIME_SINCE_COMMIT_SHORT="%{$fg[green]%}"
ZSH_THEME_GIT_TIME_SHORT_COMMIT_MEDIUM="%{$fg[yellow]%}"
ZSH_THEME_GIT_TIME_SINCE_COMMIT_LONG="%{$fg[red]%}"
ZSH_THEME_GIT_TIME_SINCE_COMMIT_NEUTRAL="%{$fg[white]%}"

ZSH_THEME_PROMPT_RETURNCODE_PREFIX=''
local return_code="%(?..%? ↵)"

# ========================== SETUPS =======================#

# Set required options.
setopt prompt_subst

# Load required modules.
autoload -U add-zsh-hook
autoload -Uz vcs_info

# Add hook for calling vcs_info before each command.
# add-zsh-hook precmd theme_precmd

# enable VCS systems you use
zstyle ':vcs_info:*' enable git hg

# check-for-changes can be really slow.
# you should disable it, if you work with large repositories
# zstyle ':vcs_info:*' check-for-changes true

# ====== FORMATS ====== #

# List of vcs_info format strings:
#
# %b => current branch
# %a => current action (rebase/merge)
# %s => current version control system
# %r => name of the root directory of the repository
# %S => current path relative to the repository root directory
# %m => in case of Git, show information about stashes
# %u => show unstaged changes in the repository
# %c => show staged changes in the repository
zstyle ':vcs_info:*' unstagedstr '%F{red}*'   # display this when there are unstaged changes
zstyle ':vcs_info:*' stagedstr '%F{yellow}+'  # display this when there are staged changes
zstyle ':vcs_info:*' actionformats \
    '%F{5}%F{5}[%F{2}%b%F{3}|%F{1}%a%c%u%F{5}]%f '
zstyle ':vcs_info:*' formats       \
    '%F{5}%F{5}[%F{2}%b%c%u%F{5}]%f '
zstyle ':vcs_info:*' branchformat '%b%F{1}:%F{3}%r%f'
zstyle ':vcs_info:*:*' nvcsformats "%~" "" ""

# zstyle ':vcs_info:*:*' formats "$FX[bold]%r$FX[no-bold]/%S" "%s/%b" "%%u%c"
# zstyle ':vcs_info:*:*' actionformats "$FX[bold]%r$FX[no-bold]/%S" "%s/%b" "%u%c (%a)"

function {
    if [[ -n "$SSH_CLIENT" ]]; then
        PROMPT_HOST="($HOST): "
    else
        PROMPT_HOST=''
    fi
}

bureau_git_status() {
  _STATUS=""

  # check status of files
  _INDEX=$(command git status --porcelain 2> /dev/null)
  if [[ -n "$_INDEX" ]]; then
    if $(echo "$_INDEX" | command grep -q '^[AMRD]. '); then
      _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_STAGED"
    fi
    if $(echo "$_INDEX" | command grep -q '^.[MTD] '); then
      _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_UNSTAGED"
    fi
    if $(echo "$_INDEX" | command grep -q -E '^\?\? '); then
      _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_UNTRACKED"
    fi
    if $(echo "$_INDEX" | command grep -q '^UU '); then
      _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_UNMERGED"
    fi
  else
    _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_CLEAN"
  fi

  # check status of local repository
  _INDEX=$(command git status --porcelain -b 2> /dev/null)
  if $(echo "$_INDEX" | command grep -q '^## .*ahead'); then
    _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_AHEAD"
  fi
  if $(echo "$_INDEX" | command grep -q '^## .*behind'); then
    _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_BEHIND"
  fi
  if $(echo "$_INDEX" | command grep -q '^## .*diverged'); then
    _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_DIVERGED"
  fi

  if $(command git rev-parse --verify refs/stash &> /dev/null); then
    _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_STASHED"
  fi

  echo $_STATUS
}

# Determine the time since last commit. If branch is clean,
# use a neutral color, otherwise colors will vary according to time.
function _git_time_since_commit() {
    if git rev-parse --git-dir > /dev/null 2>&1; then
        # Only proceed if there is actually a commit.
        if [[ $(git log 2>&1 > /dev/null | grep -c "^fatal: bad default revision") == 0 ]]; then
            # Get the last commit.
            last_commit=`git log --pretty=format:'%at' -1 2> /dev/null`
            now=`date +%s`
            seconds_since_last_commit=$((now-last_commit))

            # Totals
            MINUTES=$((seconds_since_last_commit / 60))
            HOURS=$((seconds_since_last_commit/3600))
           
            # Sub-hours and sub-minutes
            DAYS=$((seconds_since_last_commit / 86400))
            SUB_HOURS=$((HOURS % 24))
            SUB_MINUTES=$((MINUTES % 60))
            PRETEXT="Last commit: "
            POSTTEXT="Commit please, bro!"
            
            if [[ -n $(git status -s 2> /dev/null) ]]; then
                if [ "$MINUTES" -gt 30 ]; then
                    COLOR="$ZSH_THEME_GIT_TIME_SINCE_COMMIT_LONG$POSTTEXT "
                elif [ "$MINUTES" -gt 10 ]; then
                    COLOR="$ZSH_THEME_GIT_TIME_SHORT_COMMIT_MEDIUM"
                else
                    COLOR="$ZSH_THEME_GIT_TIME_SINCE_COMMIT_SHORT"
                fi
            else
                COLOR="$ZSH_THEME_GIT_TIME_SINCE_COMMIT_NEUTRAL"
            fi

            if [ "$HOURS" -gt 24 ]; then
                echo "[ $COLOR$PRETEXT${DAYS}d ${SUB_HOURS}h ${SUB_MINUTES}m%{$reset_color%} ]"
            elif [ "$MINUTES" -gt 60 ]; then
                echo "[ $PRETEXT$COLOR${HOURS}h ${SUB_MINUTES}m%{$reset_color%} ]"
            else
                echo "[ $PRETEXT$COLOR${MINUTES}m%{$reset_color%} ]"
            fi
        fi
    fi
}

# Fastest possible way to check if repo is dirty
# git_is_dirty() {
#     # Check if we're in a git repo
#     command git rev-parse --is-inside-work-tree &>/dev/null || return
#     # Check if it's dirty
#     command git diff --quiet --ignore-submodules HEAD &>/dev/null; [ $? -eq 1 ] && echo "*"
# }
# git_st_grep(arg) {
#   test -n "$(git status --short | grep $arg | wc -l"
# }

# theme_precmd () {
#     # check isset git
#     if [[ -z $(git ls-files --other --exclude-standard 2> /dev/null) ]] {
#         zstyle ':vcs_info:*' formats ' [%b%c%u%B%F{green}]'
#     } else {
#         zstyle ':vcs_info:*' formats ' [%b%c%u%B%F{red}●%F{green}]'
#     }

#     # Get VCS info before we start outputting stuff
#     vcs_info
# }

# ========================== PROMPTS =======================#

# List of prompt format strings:
#
# prompt:
# %F => color dict
# %f => reset color
# %~ => current path
# %* => time
# %n => username
# %m => shortname host
# %(?..) => prompt conditional - %(condition.true.false)
PROMPT='${PROMPT_HOST} %F{cyan}%.%f$(git_prompt_info)%f: ' #  $(git_prompt_status) $(git_current_branch)
RPROMPT='$(nvm_prompt_info) $(bureau_git_status) $(_git_time_since_commit) %*'
# RPS1="${return_code}"