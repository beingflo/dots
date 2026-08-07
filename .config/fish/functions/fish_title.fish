function fish_title
    if test "$PWD" = "$HOME"
        echo "~"
    else
        echo (path basename "$PWD")
    end
end
