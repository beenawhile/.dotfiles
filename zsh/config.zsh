
# GNU core utilities
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export VISUAL=nvim
export EDITOR=nvim

# set various options
setopt AUTO_CD
setopt EXTENDED_GLOB
setopt HIST_REDUCE_BLANKS
setopt NO_BG_NICE       # don't nice background tasks
setopt NO_CASE_GLOB     # Case insensitive globbing
setopt NO_LIST_BEEP

DISABLE_UNTRACKED_FILES_DIRTY="true" # makes repository status check for large repositories much faster
DISABLE_AUTO_TITLE="true"

# lf icons
export LF_ICONS="\
tw=:\
st=:\
ow=:\
dt=:\
di=:\
fi=:\
ln=:\
or=:\
ex=:\
*.c=:\
*.cc=:\
*.clj=:\
*.coffee=:\
*.cpp=:\
*.css=:\
*.d=:\
*.dart=:\
*.erl=:\
*.exs=:\
*.fs=:\
*.go=:\
*.h=:\
*.hh=:\
*.hpp=:\
*.hs=:\
*.html=:\
*.java=:\
*.jl=:\
*.js=:\
*.json=:\
*.lua=:\
*.md=:\
*.php=:\
*.pl=:\
*.pro=:\
*.py=:\
*.rb=:\
*.rs=:\
*.scala=:\
*.ts=:\
*.vim=:\
*.cmd=:\
*.ps1=:\
*.sh=:\
*.bash=:\
*.zsh=:\
*.fish=:\
*.tar=:\
*.tgz=:\
*.arc=:\
*.arj=:\
*.taz=:\
*.lha=:\
*.lz4=:\
*.lzh=:\
*.lzma=:\
*.tlz=:\
*.txz=:\
*.tzo=:\
*.t7z=:\
*.zip=:\
*.z=:\
*.dz=:\
*.gz=:\
*.lrz=:\
*.lz=:\
*.lzo=:\
*.xz=:\
*.zst=:\
*.tzst=:\
*.bz2=:\
*.bz=:\
*.tbz=:\
*.tbz2=:\
*.tz=:\
*.deb=:\
*.rpm=:\
*.jar=:\
*.war=:\
*.ear=:\
*.sar=:\
*.rar=:\
*.alz=:\
*.ace=:\
*.zoo=:\
*.cpio=:\
*.7z=:\
*.rz=:\
*.cab=:\
*.wim=:\
*.swm=:\
*.dwm=:\
*.esd=:\
*.jpg=:\
*.jpeg=:\
*.mjpg=:\
*.mjpeg=:\
*.gif=:\
*.bmp=:\
*.pbm=:\
*.pgm=:\
*.ppm=:\
*.tga=:\
*.xbm=:\
*.xpm=:\
*.tif=:\
*.tiff=:\
*.png=:\
*.svg=:\
*.svgz=:\
*.mng=:\
*.pcx=:\
*.mov=:\
*.mpg=:\
*.mpeg=:\
*.m2v=:\
*.mkv=:\
*.webm=:\
*.ogm=:\
*.mp4=:\
*.m4v=:\
*.mp4v=:\
*.vob=:\
*.qt=:\
*.nuv=:\
*.wmv=:\
*.asf=:\
*.rm=:\
*.rmvb=:\
*.flc=:\
*.avi=:\
*.fli=:\
*.flv=:\
*.gl=:\
*.dl=:\
*.xcf=:\
*.xwd=:\
*.yuv=:\
*.cgm=:\
*.emf=:\
*.ogv=:\
*.ogx=:\
*.aac=:\
*.au=:\
*.flac=:\
*.m4a=:\
*.mid=:\
*.midi=:\
*.mka=:\
*.mp3=:\
*.mpc=:\
*.ogg=:\
*.ra=:\
*.wav=:\
*.oga=:\
*.opus=:\
*.spx=:\
*.xspf=:\
*.pdf=:\
*.nix=:\
"

# dotfile-related
export PATH="$PATH:/usr/local/sbin:$DOTFILES/bin:$HOME/.local/bin"
# -----------------------

# brew
export PATH=/opt/homebrew/bin:$PATH
# -----------------------

# docker: x11
export DOCKER_DISPLAY=$(ifconfig en0 | grep inet\ | awk '{ print $2 ":0" }')
# -----------------------

# asdf
. /opt/homebrew/opt/asdf/libexec/asdf.sh
# -----------------------

# direnv
eval "$(direnv hook zsh)"
source "${XDG_CONFIG_HOME:-$HOME/.config}/asdf-direnv/zshrc"
# -----------------------

# dart
export PATH="$PATH":"$HOME/.pub-cache/bin"
export PATH="$PATH":"$(asdf where flutter)/bin/cache/dart-sdk"
## [Completion] 
## Completion scripts setup. Remove the following line to uninstall
[[ -f /Users/admin/.dart-cli-completion/zsh-config.zsh ]] && . /Users/admin/.dart-cli-completion/zsh-config.zsh || true
## [/Completion]
# -----------------------

# google cloud
source "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc"
source "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc"
# -----------------------

# Android SDK Manager
export ANDROID_SDK_ROOT=$HOME/Android/SDK
export PATH=$PATH:$ANDROID_SDK_ROOT/cmdline-tools/latest/bin
export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools
# - to make adb avaialbe
# -----------------------

# starship
eval "$(starship init zsh)"
# -----------------------
