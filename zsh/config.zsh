
# GNU core utilities
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export VISUAL=nvim
export EDITOR=nvim

# set various options
setopt AUTO_CD
setopt EXTENDED_GLOB
setopt HIST_REDUCE_BLANKS
setopt NO_BG_NICE       # don't nice background tasks
setopt NO_CASE_GLOB     # Case insensitive globbing
setopt NO_LIST_BEEP

DISABLE_UNTRACKED_FILES_DIRTY="true" # makes repository status check for large repositories much faster
DISABLE_AUTO_TITLE="true"
