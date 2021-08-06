_git_branch_dirty() (
    git rev-parse --is-inside-work-tree >/dev/null 2>&1 || return

    branch=$(git rev-parse --abbrev-ref HEAD)
    dirty=$(test -n "$(git --no-optional-locks status --porcelain --ignore-submodules --untracked-files=normal)" && echo "*")
    # dirty mark https://github.com/sindresorhus/pure
    echo "$branch$dirty "
)

display_notification() (
    text=$1
    title=${2:-"Bash"}

    osascript -e 'on run argv' \
        -e 'display notification (item 1 of argv) with title (item 2 of argv)' \
        -e 'end run' \
        "$text" "$title"
)

gemscrub() (
    gem pristine --all --env-shebang --no-extensions --skip=bundler "$@"
)

rebundle() (
    bundle && bundle clean --force && bundle pristine && display_notification "Rebundled!"
)

until_nonzero() (
    command="$*"
    count=0

    while eval "$command"
    do count=$((count + 1))
    done

    display_notification "Failed: $command"
    echo "$count"
)
