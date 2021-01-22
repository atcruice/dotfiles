# These can't go in programs.bash.sessionVariables because
# programs.bash.initExtra is assembled later
CDPATH=".:~:~/code/fivegoodfriends:~/code/atcruice"
PROMPT_COMMAND="$PROMPT_COMMAND;update_terminal_cwd"
