if status is-interactive
    # Commands to run in interactive sessions can go here
end

set fish_greeting

zoxide init fish --cmd cd | source

alias cat='bat --style=plain --paging=never'

set -gx EDITOR nvim

# CTRL+j/k for up down (arrow keys)
bind \ck up-or-search
bind \cj down-or-search

# CTRL+l for accepting suggestion
bind \cl accept-autosuggestion

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

abbr -a cc nono run --profile nolabs-ai/claude --allow-cwd --read ~/.local/share/mise --allow /Users/fmarendi/Documents/dev/ -- claude
abbr -a z zellij
