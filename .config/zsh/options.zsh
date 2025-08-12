# navigation
setopt AUTO_CD              # Go to folder path without using cd
setopt AUTO_PUSHD           # Make cd push the old directory onto the directory stack.
setopt PUSHD_IGNORE_DUPS    # Don’t push multiple copies of the same directory onto the directory stack.
setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd.
setopt CORRECT              # Try to correct the spelling of commands.
setopt CDABLE_VARS          # If argument to cd is not a directory try to expand to a path
setopt EXTENDED_GLOB        # Treat the ‘#’, ‘~’ and ‘^’ characters as part of patterns for filename generation

# history
# setopt SHARE_HISTORY            # share history across sessions
setopt EXTENDED_HISTORY         # include timestamp
setopt HIST_IGNORE_DUPS         # Do not record an event that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS     # Delete an old recorded event if a new event is a duplicate.
setopt HIST_SAVE_NO_DUPS        # Do not write a duplicate event to the history file.
setopt HIST_FIND_NO_DUPS        # Do not display a previously found event.
setopt HIST_IGNORE_SPACE        # Do not record an event starting with a space.
setopt HIST_VERIFY              # Do not execute immediately upon history expansion.
setopt HIST_EXPIRE_DUPS_FIRST   # if history needs to be trimmed, remove dupe event first. not needed once history unique
setopt HIST_REDUCE_BLANKS       # Remove superfluous blanks from each command line being added to the history list.
setopt APPEND_HISTORY           # zsh sessions will append their history list to the history file, rather than replace it
setopt INC_APPEND_HISTORY_TIME  # lines are added to the $HISTFILE as soon as  they are  entered with the time it took to complete

# completion
setopt MENU_COMPLETE    # Automatically highlight first element of completion menu
setopt AUTO_LIST        # Automatically list choices on ambiguous completion.
setopt COMPLETE_IN_WORD # Complete from both ends of a word.

