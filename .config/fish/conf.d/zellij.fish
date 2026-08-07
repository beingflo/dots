function __zellij_rename_tab --on-variable PWD
    set -q ZELLIJ; or return

    if test "$PWD" = "$HOME"
        set -f name "~"
    else
        set -f name (basename "$PWD")
    end

    command zellij action rename-tab -- "$name" &>/dev/null &
    disown
end

# --on-variable PWD doesn't fire at startup, so seed it once
if status is-interactive
    __zellij_rename_tab
end
