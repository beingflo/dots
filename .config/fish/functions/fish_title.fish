# Terminal title: the running command while one runs, else the last command
# (abbreviated, recorded in conf.d/herdr-title.fish), else the folder.
# Herdr shows this title as the tab's label.
function fish_title
    set -l running (status current-command)
    if test -n "$running" -a "$running" != fish
        echo (string sub -l 24 -- $running)
        return
    end
    if set -q __herdr_last; and test -n "$__herdr_last"
        set -l parts (string replace -ra '\s+' ' ' -- $__herdr_last | string trim | string split -m 2 ' ')
        echo (string sub -l 22 -- (string join ' ' -- $parts[1..2]))
        return
    end
    if test "$PWD" = "$HOME"
        echo "~"
    else
        echo (path basename "$PWD")
    end
end
