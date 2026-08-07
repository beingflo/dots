function jjbm --description "Move a jj bookmark matching a partial name to @ or @-"
    if test (count $argv) -ne 1
        echo "Usage: jjbm <partial-bookmark-name>"
        return 1
    end

    set -l pattern $argv[1]
    set -l bookmark (jj bookmark list -T 'name ++ "\n"' | fzf --filter=$pattern --select-1)

    if test $status -ne 0 -o -z "$bookmark"
        echo "No bookmarks matching '$pattern'"
        return 1
    end

    if test (count $bookmark) -gt 1
        set bookmark (printf '%s\n' $bookmark | fzf --prompt="Select bookmark: ")
        or return 1
    end

    set -l has_changes (jj diff --stat | string collect)
    set -l description (jj log -r @ --no-graph -T description | string collect)

    set -l target @-
    if test -n "$has_changes" -a -n "$description"
        set target @
    end

    echo "Moving '$bookmark' → $target"
    jj bookmark move $bookmark --to $target
end
