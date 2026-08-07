function jjr
    set file (jj diff --summary | fzf | awk '{print $2}')
    or return
    if test -n "$file"
        jj restore $file
    end
end
