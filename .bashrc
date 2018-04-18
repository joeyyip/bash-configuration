PROMPT_TEXT_COLOR="tput setaf 2";
SHELL_TEXT_COLOR="tput sgr0";

# Auto-completion script for git commands
source /Users/joeyyip/dev/config/git-completion.bash

#
# Updating global settings
#
PATH="${PATH}:/Users/joeyyip/Applications/apache-maven-3.5.0/bin"
PATH="${PATH}:/Users/joeyyip/Applications/xpdf-tools-mac-4.00/bin64"

# Bash title shows relative path under /Users/joeyyip
export PROMPT_COMMAND='echo -ne "\033]0;${PWD##*/Users/joeyyip/}\007" ;'${PROMPT_COMMAND};

# Custom command line prompt. Shows time, username, and PWD
export PS1="$(${PROMPT_TEXT_COLOR})\@ \u@\h:\w>$(${SHELL_TEXT_COLOR}) #
"

# For bash-git-prompt
if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
    __GIT_PROMPT_DIR=$(brew --prefix)/opt/bash-git-prompt/share
    source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
fi
GIT_PROMPT_ONLY_IN_REPO=1
GIT_PROMPT_START="$(${PROMPT_TEXT_COLOR})\@ \u@\h:\w>$(${SHELL_TEXT_COLOR})"
GIT_PROMPT_END=" #
"

export HISTCONTROL=ignoredups

#
# Useful aliases
#
alias l="ls -ohG"
alias rm="rm -i"
alias mv="mv -i"
alias cp="cp -i"

# Application shortcuts
alias vi="/Applications/MacVim.app/Contents/MacOS/Vim"
alias gvi="/Applications/MacVim.app/Contents/MacOS/MacVim"
alias meld="/Applications/Meld.app/Contents/MacOS/Meld"

alias add_reviewers_web_pres="~/dev/add_reviewers_to_pull_request/add_reviewers.sh -u yipc -r 'JUSUFA HAYR BALLESTF JAHAF PEEKG LIUJI REOCHN DESAIP CHATOOR GUL'"
alias add_reviewers_dmp="~/dev/add_reviewers_to_pull_request/add_reviewers.sh -u yipc -r 'CHIUK CHOIR TAPDIYAS PACIGAG ELLIOTTK'"
