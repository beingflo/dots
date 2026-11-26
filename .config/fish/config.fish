if status is-interactive
    # Commands to run in interactive sessions can go here
end

set fish_greeting

zoxide init fish --cmd cd | source

alias cat='bat --style=plain --paging=never'
alias pia 'nono run --profile nolabs-ai/pi --allow-cwd -- pi'

set -gx EDITOR nvim

set -gx PATH ~/.local/bin $PATH
set -gx PATH /opt/podman/bin $PATH

# CTRL+j/k for up down (arrow keys)
bind \ck up-or-search
bind \cj down-or-search

# CTRL+l for accepting suggestion
bind \cl accept-autosuggestion
