# Dotfiles

## Dependencies

```
i3wm
network-manager-applet
i3status-rust
i3lock
picom
i3-nagbar
alacritty
fastfetch
rofi
librewolf
discord
spotify
steam
feh
flameshot
xorg-xrandr
autorandr
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
xorg-xinit
xorg-server
ly
nvim
zoxide
ttf-iosevka-nerd
noto-fonts-emoji
catppuccin-gtk-theme-mocha
xclip
fzf
ripgrep
fd
ranger
w3m
clipmenu
udiskie
```

## Setup

- Install `paru`.
- Set zsh the [default shell](https://wiki.archlinux.org/title/Command-line_shell#Changing_your_default_shell).
- Link `$HOME/.config/.zshrc -> $HOME/.zshrc`.
```
ln -s /home/$USER/.config/.zshrc /home/$USER/.zshrc
```
- Link `/etc/ly/config.ini -> $HOME/.config/ly/config.ini`.
```
sudo ln -s /home/$USER/.config/ly/config.ini /etc/ly/config.ini
```
- [Firefox based web browsers]: Set `widgeuse-xdg-desktop-portal.file-picker` to 0 in about:config tab.
- Move files such as `.zshrc`, `.xinitrc` and `.vimrc` to `$HOME` directory.
- Install [ranger-zoxide](https://github.com/jchook/ranger-zoxide) plugin
