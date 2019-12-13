brew cask install visual-studio-code

CUR_DIR=$HOME/.config/vscode
VSCODE_PATH="/Users/""$(whoami)""/Library/Application Support/Code/User"

function link() {
    if [[ -e "$VSCODE_PATH"/$1 ]]; then
        rm "$VSCODE_PATH/$1"
    fi
    ln -s "$CUR_DIR"/$1 "$VSCODE_PATH"
}

# Sync config
if [[ ! -d "$VSCODE_PATH" ]]; then
    mkdir -p "$VSCODE_PATH"
fi
link keybindings.json
link locale.json
link settings.json
link vsicons.settings.json
link snippets
