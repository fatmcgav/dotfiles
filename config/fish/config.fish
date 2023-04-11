if status is-interactive
    # Commands to run in interactive sessions can go here
    set -x ASDF_DATA_DIR "$HOME/.asdf"
end

# Setup Starship prompt
starship init fish | source
enable_transience
