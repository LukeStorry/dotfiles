PS1='\[\033]0;${PWD#*code/}\007\]' # set window title, minus code dir
PS1="$PS1"'\n'                 # new line
PS1="$PS1"'\[\033[44m\]'       # change to cyan background
PS1="$PS1"'\u@\h  '             # user@host<space>
PS1="$PS1"'\[\033[37;1m\]'     # change text color to bright white
PS1="$PS1"'\w'                 # current working directory
if test -z "$WINELOADERNOEXEC"
then
    GIT_EXEC_PATH="$(git --exec-path 2>/dev/null)"
    COMPLETION_PATH="${GIT_EXEC_PATH%/libexec/git-core}"
    COMPLETION_PATH="${COMPLETION_PATH%/lib/git-core}"
    COMPLETION_PATH="$COMPLETION_PATH/share/git/completion"
    if test -f "$COMPLETION_PATH/git-prompt.sh"
    then
        PS1="$PS1"'\[\033[36;1m\]'  # change text color to cyan
        . "$COMPLETION_PATH/git-completion.bash"
        . "$COMPLETION_PATH/git-prompt.sh"
        PS1="$PS1"'`__git_ps1`'   # bash function
    fi
fi
PS1="$PS1"'\[\033[0m\]'        # change color to default
PS1="$PS1"'\n'                 # new line
PS1="$PS1"'$ '                 # prompt: always $
