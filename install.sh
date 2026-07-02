#!/usr/bin/env bash

set -euo pipefail

# Dotfiles to install
DOTFILES=(
    ".bashrc"
    ".vimrc"
    ".inputrc"
)

# Repository root (directory containing this script)
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
HOME_DIR="$HOME"

backup_path() {
    local path="$1"

    if [[ ! -e "${path}.backup" && ! -L "${path}.backup" ]]; then
        echo "${path}.backup"
        return
    fi

    local i=1
    while [[ -e "${path}.backup.${i}" || -L "${path}.backup.${i}" ]]; do
        ((i++))
    done

    echo "${path}.backup.${i}"
}

install_file() {
    local file="$1"
    local src="${REPO_DIR}/${file}"
    local dst="${HOME_DIR}/${file}"

    if [[ ! -e "$src" ]]; then
        echo "Skipping $src (source file does not exist)"
        return
    fi

    if [[ -e "$dst" || -L "$dst" ]]; then

        if cmp -s "$src" "$dst"; then
            echo "Skipping $file (already up to date)"
            return
        fi
        
        backup="$(backup_path "$dst")"
        mv "$dst" "$backup"
        echo "Existing $file moved to: $backup"
    fi

    cp -a "$src" "$dst"
    echo "Installed $file"
}

for file in "${DOTFILES[@]}"; do
    install_file "$file"
done
