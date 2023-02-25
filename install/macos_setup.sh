#!/usr/bin/env zsh

xcode-select --install

# download brew if there is not
if ! which brew
then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# get permission to activate cask apps later on
read -r -s -p "[sudo] sudo password for $(whoami):" pass

brew update && brew upgrade

# install brew bundle apps
brew bundle --file=./Brewfile

# give permission to cask apps
# TODO: add specific apps
echo "$pass" | sudo -S xattr -dr com.apple.quarantine /Applications/Alacritty.app
echo "$pass" | sudo -S xattr -dr com.apple.quarantine /Applications/BetterDisplay.app
echo "$pass" | sudo -S xattr -dr com.apple.quarantine /Applications/CheatSheet.app
echo "$pass" | sudo -S xattr -dr com.apple.quarantine /Applications/DevToys.app
echo "$pass" | sudo -S xattr -dr com.apple.quarantine /Applications/Docker.app
echo "$pass" | sudo -S xattr -dr com.apple.quarantine /Applications/eul.app
echo "$pass" | sudo -S xattr -dr com.apple.quarantine /Applications/Keka.app
echo "$pass" | sudo -S xattr -dr com.apple.quarantine /Applications/Microsoft\ Remote\ Desktop.app
echo "$pass" | sudo -S xattr -dr com.apple.quarantine /Applications/Neo\ Noir.app
echo "$pass" | sudo -S xattr -dr com.apple.quarantine /Applications/Notion.app
echo "$pass" | sudo -S xattr -dr com.apple.quarantine /Applications/Obsidian.app
echo "$pass" | sudo -S xattr -dr com.apple.quarantine /Applications/OnyX.app
echo "$pass" | sudo -S xattr -dr com.apple.quarantine /Applications/Raycast.app
echo "$pass" | sudo -S xattr -dr com.apple.quarantine /Applications/Google\ Chrome.app
echo "$pass" | sudo -S xattr -dr com.apple.quarantine /Applications/Visual\ Studio\ Code.app

./dotfile_link.sh

printf '\n\n🎉 Congrat! Your mac has been set up successfully for working!\n'
