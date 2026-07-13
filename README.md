# Dotfiles

## Dependencies

```
i3wm
i3status-rust
i3lock
i3-nagbar
alacritty
rofi
librewolf
discord
spotify
steam
feh
flameshot
xrandr
playerctl
brightnessctl
pactl
dunst
curl
man
zsh
zsh-completions
pipewire
wireplumbler
cmatrix
xinit
xorg-server
ly
nvim
zoxide
ttf-iosevka-nerd
```

## Setup

- Set zsh the [default shell](https://wiki.archlinux.org/title/Command-line_shell#Changing_your_default_shell).
- Create link `/etc/ly/config.ini -> $HOME/.config/ly/config.ini`.
```
sudo ln -s /home/$USER/.config/ly/config.ini /etc/ly/config.ini
```
- [Firefox based web browsers]: Set widget.use-xdg-desktop-portal.file-picker to 0 in about:config tab.
- Move files such as `.zshrc`, `.xinitrc` and `.vimrc` to `$HOME` directory.
