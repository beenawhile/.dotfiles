source_if_exists () {
  if test -r "$1"; then
    source "$1"
  fi
}

source_if_exists $HOME/.env.sh
source_if_exists $HOME/.config/.proxy.sh
source_if_exists $DOTFILES/zsh/history.zsh
source_if_exists $DOTFILES/zsh/git.zsh
source_if_exists $DOTFILES/zsh/config.zsh
source_if_exists $DOTFILES/zsh/packages.zsh
source_if_exists $DOTFILES/zsh/functions.zsh
source_if_exists ~/.fzf.zsh
source_if_exists ~/.config/.fun.sh
source_if_exists $DOTFILES/zsh/aliases.zsh
source_if_exists /usr/local/etc/profile.d/z.sh
source_if_exists /opt/homebrew/etc/profile.d/z.sh
