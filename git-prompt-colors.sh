# This is the custom theme template for gitprompt.sh

# These are the defaults from the "Default" theme
# You just need to override what you want to have changed
override_git_prompt_colors() {
        GIT_PROMPT_THEME_NAME="Custom"

        GIT_PROMPT_LEADING_SPACE=0
        MY_COLOR="\e[38;5;240m"

        # These are the color definitions used by gitprompt.sh
        if [ -z ${GIT_PROMPT_PREFIX} ]; then GIT_PROMPT_PREFIX="${MY_COLOR}["; fi                 # start of the git info string
        if [ -z ${GIT_PROMPT_SUFFIX} ]; then GIT_PROMPT_SUFFIX="${MY_COLOR}]${ResetColor}"; fi                 # the end of the git info string
        if [ -z ${GIT_PROMPT_SEPARATOR} ]; then GIT_PROMPT_SEPARATOR="${MY_COLOR}|"; fi              # separates each item

        #if [ -z ${GIT_PROMPT_BRANCH} ]; then GIT_PROMPT_BRANCH="${Magenta}"; fi        # the git branch that is active in the current directory
        if [ -z ${GIT_PROMPT_BRANCH} ]; then GIT_PROMPT_BRANCH="${MY_COLOR}"; fi        # the git branch that is active in the current directory
        #if [ -z ${GIT_PROMPT_STAGED} ]; then GIT_PROMPT_STAGED="${Red}●"; fi           # the number of staged files/directories
        if [ -z ${GIT_PROMPT_STAGED} ]; then GIT_PROMPT_STAGED="${MY_COLOR}●"; fi           # the number of staged files/directories
        #GIT_PROMPT_STAGED="●"           # the number of staged files/directories
        #if [ -z ${GIT_PROMPT_CONFLICTS} ]; then GIT_PROMPT_CONFLICTS="${Red}✖ "; fi       # the number of files in conflict
        if [ -z ${GIT_PROMPT_CONFLICTS} ]; then GIT_PROMPT_CONFLICTS="${MY_COLOR}✖ "; fi       # the number of files in conflict
        #GIT_PROMPT_CONFLICTS="✖ "       # the number of files in conflict
        #if [ -z ${GIT_PROMPT_CHANGED} ]; then GIT_PROMPT_CHANGED="${Blue}✚ "; fi        # the number of changed files
        if [ -z ${GIT_PROMPT_CHANGED} ]; then GIT_PROMPT_CHANGED="${MY_COLOR}✚ "; fi        # the number of changed files
        #GIT_PROMPT_CHANGED="✚ "        # the number of changed files

        if [ -z ${GIT_PROMPT_REMOTE} ]; then GIT_PROMPT_REMOTE=" "; fi                 # the remote branch name (if any) and the symbols for ahead and behind
        #if [ -z ${GIT_PROMPT_UNTRACKED} ]; then GIT_PROMPT_UNTRACKED="${Cyan}…"; fi       # the number of untracked files/dirs
        if [ -z ${GIT_PROMPT_UNTRACKED} ]; then GIT_PROMPT_UNTRACKED="${MY_COLOR}…"; fi       # the number of untracked files/dirs
        #GIT_PROMPT_UNTRACKED="…"       # the number of untracked files/dirs
        #if [ -z ${GIT_PROMPT_STASHED} ]; then GIT_PROMPT_STASHED="${BoldBlue}⚑ "; fi    # the number of stashed files/dir
        if [ -z ${GIT_PROMPT_STASHED} ]; then GIT_PROMPT_STASHED="${MY_COLOR}⚑ "; fi    # the number of stashed files/dir
        #GIT_PROMPT_STASHED="⚑ "    # the number of stashed files/dir
        #if [ -z ${GIT_PROMPT_CLEAN} ]; then GIT_PROMPT_CLEAN="${BoldGreen}✔"; fi      # a colored flag indicating a "clean" repo
        if [ -z ${GIT_PROMPT_CLEAN} ]; then GIT_PROMPT_CLEAN="${MY_COLOR}✔"; fi      # a colored flag indicating a "clean" repo
        #GIT_PROMPT_CLEAN="✔"      # a colored flag indicating a "clean" repo

        # For the command indicator, the placeholder _LAST_COMMAND_STATE_
        # will be replaced with the exit code of the last command
        # e.g.
        # GIT_PROMPT_COMMAND_OK="${Green}✔-_LAST_COMMAND_STATE_ "    # indicator if the last command returned with an exit code of 0
        # GIT_PROMPT_COMMAND_FAIL="${Red}✘-_LAST_COMMAND_STATE_ "    # indicator if the last command returned with an exit code of other than 0

        #if [ -z ${GIT_PROMPT_COMMAND_OK} ]; then GIT_PROMPT_COMMAND_OK="${Green}✔"; fi    # indicator if the last command returned with an exit code of 0
        if [ -z ${GIT_PROMPT_COMMAND_OK} ]; then GIT_PROMPT_COMMAND_OK="${MY_COLOR}✔"; fi    # indicator if the last command returned with an exit code of 0
        #GIT_PROMPT_COMMAND_OK="✔"    # indicator if the last command returned with an exit code of 0
        #if [ -z ${GIT_PROMPT_COMMAND_FAIL} ]; then GIT_PROMPT_COMMAND_FAIL="${Red}✘-_LAST_COMMAND_STATE_"; fi    # indicator if the last command returned with an exit code of other than 0
        if [ -z ${GIT_PROMPT_COMMAND_FAIL} ]; then GIT_PROMPT_COMMAND_FAIL="${MY_COLOR}✘-_LAST_COMMAND_STATE_"; fi    # indicator if the last command returned with an exit code of other than 0
        #GIT_PROMPT_COMMAND_FAIL="✘-_LAST_COMMAND_STATE_"    # indicator if the last command returned with an exit code of other than 0

        # Possible to change which command is used to create git status information
        # There are three options:
        # 1) gitstatus.sh (uses git status --branch --porcelain - fast, requires git > 1.7.10)
        # 2) gitstatus_pre-1.7.10.sh (Uses a variety of git commands and pipes - slower, works with older git clients)
        # 3) gitstatus.py (Unsupported, lack features found in the bash versions)
        if [ -z ${GIT_PROMPT_STATUS_COMMAND} ]; then GIT_PROMPT_STATUS_COMMAND="gitstatus.sh"; fi    # Point out the command to get the git status from

        # template for displaying the current virtual environment
        # use the placeholder _VIRTUALENV_ will be replaced with
        # the name of the current virtual environment (currently CONDA and VIRTUAL_ENV)
        #if [ -z ${GIT_PROMPT_VIRTUALENV} ]; then GIT_PROMPT_VIRTUALENV="(${Blue}_VIRTUALENV_${ResetColor}) "; fi
        if [ -z ${GIT_PROMPT_VIRTUALENV} ]; then GIT_PROMPT_VIRTUALENV="(_VIRTUALENV_${ResetColor}) "; fi

        # template for displaying the current remote tracking branch
        # use the placeholder _UPSTREAM_ will be replaced with
        # the name of the current remote tracking branch
        #if [ -z ${GIT_PROMPT_UPSTREAM} ]; then GIT_PROMPT_UPSTREAM=" {${Blue}_UPSTREAM_${ResetColor}}"; fi
        if [ -z ${GIT_PROMPT_UPSTREAM} ]; then GIT_PROMPT_UPSTREAM=" {_UPSTREAM_${ResetColor}}"; fi

        # _LAST_COMMAND_INDICATOR_ will be replaced by the appropriate GIT_PROMPT_COMMAND_OK OR GIT_PROMPT_COMMAND_FAIL
        #if [ -z ${GIT_PROMPT_START_USER} ]; then GIT_PROMPT_START_USER="_LAST_COMMAND_INDICATOR_ ${Yellow}${PathShort}${ResetColor}"; fi
        #if [ -z ${GIT_PROMPT_START_USER} ]; then GIT_PROMPT_START_USER="${PathShort}"; fi
        GIT_PROMPT_START_USER="${PathShort}"
        #if [ -z ${GIT_PROMPT_START_ROOT} ]; then GIT_PROMPT_START_ROOT="${GIT_PROMPT_START_USER}"; fi
        GIT_PROMPT_START_ROOT="${GIT_PROMPT_START_USER}"
        if [ -z ${GIT_PROMPT_END_USER} ]; then GIT_PROMPT_END_USER=" \n${White}${Time12a}${ResetColor} $ "; fi
        if [ -z ${GIT_PROMPT_END_ROOT} ]; then GIT_PROMPT_END_ROOT=" \n${White}${Time12a}${ResetColor} # "; fi

        # Please do not add colors to these symbols
        if [ -z ${GIT_PROMPT_SYMBOLS_AHEAD} ]; then GIT_PROMPT_SYMBOLS_AHEAD="↑·"; fi             # The symbol for "n versions ahead of origin"
        if [ -z ${GIT_PROMPT_SYMBOLS_BEHIND} ]; then GIT_PROMPT_SYMBOLS_BEHIND="↓·"; fi            # The symbol for "n versions behind of origin"
        if [ -z ${GIT_PROMPT_SYMBOLS_PREHASH} ]; then GIT_PROMPT_SYMBOLS_PREHASH=":"; fi            # Written before hash of commit, if no name could be found
        if [ -z ${GIT_PROMPT_SYMBOLS_NO_REMOTE_TRACKING} ]; then GIT_PROMPT_SYMBOLS_NO_REMOTE_TRACKING="L"; fi # This symbol is written after the branch, if the branch is not tracked
}
reload_git_prompt_colors "Custom"
