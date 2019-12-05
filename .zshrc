ce() {

    # Get all predefined configuration files and choose one to edit
    local file
    file=$(find -L $(envsubst < $HOME/.configs) -type f | fzf --preview='head -v --lines=$FZF_PREVIEW_LINES {}' --preview-window=up:75%)

    if [[ -z "$file" ]]; then
        return
    fi

    # Find out whether the user can write to the target file
    if [[ -w "$file" ]]; then
        $EDITOR "$file"
    else
        sudo $EDITOR "$file"
    fi
}
