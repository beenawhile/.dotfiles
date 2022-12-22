#!/usr/bin/env zsh

printf '\n\nSetting up dotfiles...\n'

stow git
stow zsh
stow direnv
stow nvim
stow tmux
stow alacritty

printf '\n\nDone!\n'
