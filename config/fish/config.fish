if status is-interactive
    # Commands to run in interactive sessions can go here
    set --export ASDF_DATA_DIR "$HOME/.asdf"
    set --export SHELL /usr/bin/fish
    set --export EDITOR "nvim"

    # Enable asdf
    source /opt/asdf-vm/asdf.fish

    # Don't auto-connect to Tmux
    set -Ux fish_tmux_autoconnect false
    set -Ux fish_tmux_default_session_name "scratch"
    set -Ux fish_tmux_autostart false

    # Enable direnv
    if which direnv > /dev/null
	    direnv hook fish | source
    end

    # Krew plugins
    set -gx PATH $PATH $HOME/.krew/bin

    # Load Kubectl aliases
    test -f $HOME/.config/fish/kubectl_aliases.fish && source $HOME/.config/fish/kubectl_aliases.fish

    # Setup Starship prompt
    starship init fish | source
    enable_transience
end

