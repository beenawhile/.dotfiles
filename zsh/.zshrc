# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
  print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
  command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
  command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
    print -P "%F{33} %F{34}Installation successful.%f%b" || \
    print -P "%F{160} The clone has failed.%f%b"
fi

# Zinit-related
source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# brew-related
export PATH=/opt/homebrew/bin:$PATH

# dart
export PATH="$PATH":"$HOME/.pub-cache/bin"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# PowerLevel10k theme
zinit ice depth=1; zinit light romkatv/powerlevel10k

# Installs total of 22 plugins
zinit light zsh-users/zsh-autosuggestions
zinit light zdharma-continuum/fast-syntax-highlighting

# 快速 目 转
zinit ice lucid wait='1'

zinit light Aloxaf/fzf-tab

# source your own shrc file if exists
[ -f ~/.config/.env.sh ] && source ~/.config/.env.sh

# source your own alias file if exists
[ -f ~/.config/.alias.sh ] && source ~/.config/.alias.sh

# source your own function file if exists
[ -f ~/.config/.fun.sh ] && source ~/.config/.fun.sh

# source your proxy shrc file if exists
[ -f ~/.config/.proxy.sh ] && source ~/.config/.proxy.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# 补 全 快键 重重
bindkey ',' autosuggest-accept

zinit load asdf-vm/asdf

# Hook direnv into your shell.
eval "$(asdf exec direnv hook zsh)"
# A shortcut for asdf managed direnv.
direnv() { asdf exec direnv "$@"; }

# aliases
alias vim='nvim'
alias rm='trash -v'
alias cat='bat'
alias ls='exa'
alias ll='exa -alh'

## [Completion] 
## Completion scripts setup. Remove the following line to uninstall
[[ -f /Users/admin/.dart-cli-completion/zsh-config.zsh ]] && . /Users/admin/.dart-cli-completion/zsh-config.zsh || true
## [/Completion]

