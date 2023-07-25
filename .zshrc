source $HOME/.config/antigen.zsh

newalias() {
	echo "alias $1=\"$2\"" | tee -a /home/batista/.zshrc
  exec zsh
}

# Antigen
antigen use oh-my-zsh
antigen theme fishy
antigen bundle git
antigen bundle web-search
antigen bundle zsh-users/zsh-autosuggestions
antigen apply

# Keybinds
bol() {
  zle beginning-of-line
}
zle -N bol
bindkey '^a' bol
bindkey '^d' forward-kill-word
bindkey '^s' autosuggest-accept

#Functions
bit() {
  git $1 git@bitbucket.org:$2.git $3
}
sedex() {
  files="$(rg -l $1)"
  for f in $files; do
    sed -i "s/$2/$2/g" $f€ý,  €ý,
  done
  echo "$(wc -l <<< $files) files changed"
}

#Exports
export PATH="${PATH}:${HOME}/.local/bin/"
export EDITOR='vim'
export WINIT_X11_SCALE_FACTOR=2
export FZF_DEFAULT_COMMAND='rg --files --follow --hidden'
export SHELL="/bin/zsh"

#Aliases
alias sudo="sudo "
alias vim="nvim"
alias vimrc="nvim ~/.config/nvim/init.vim"
alias zshrc="nvim ~/.zshrc"
alias cat="bat"
alias neovide="neovide --multigrid"
alias kbintl="setxkbmap -layout us -variant altgr-intl"
alias kbpt="setxkbmap -layout pt"
alias synergy="synergys -c ~/.config/synergy-config; kbintl"
alias spotify-cli="python -m spotifycli"
alias pacq="zypper search -s"
alias paci="sudo zypper install"
alias wiki="vim ~/Documents/wiki/index.md"
alias tmuxinator="/usr/lib64/ruby/gems/3.2.0/gems/tmuxinator-3.0.5/bin/tmuxinator"
alias update_flatpak_desktop_entries="sudo ln -s /var/lib/snapd/desktop/applications/*.desktop /usr/share/applications/ 2> /dev/null"
