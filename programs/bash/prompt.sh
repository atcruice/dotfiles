# Terminfo escape aliases
RESET="\[$(tput sgr0)\]"
# BLACK="\[$(tput setaf 0)\]"
# RED="\[$(tput setaf 1)\]"
# GREEN="\[$(tput setaf 2)\]"
# YELLOW="\[$(tput setaf 3)\]"
# BLUE="\[$(tput setaf 4)\]"
# MAGENTA="\[$(tput setaf 5)\]"
CYAN="\[$(tput setaf 6)\]"
# WHITE="\[$(tput setaf 7)\]"
GIT_RED="\[$(tput setaf 196)\]"

# Can't be declared in programs.bash.sessionVariables, it relies on a function
# that isn't defined until after programs.bash.initExtra is assembled later
PS1="$CYAN\w $GIT_RED\$(_git_branch_dirty)$RESET\$ "
