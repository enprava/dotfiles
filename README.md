# Dotfiles

## Dependencies

```
i3wm
i3status-rust
i3lock
picom
i3-nagbar
alacritty
fastfetch
rofi
librewolf
libappindicator
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
pulsemixer
bluez
bluez-utils
bluetuith
```

## Setup

- Install `paru`.
- Set zsh the [default shell](https://wiki.archlinux.org/title/Command-line_shell#Changing_your_default_shell).
- Link `$HOME/.config/.xinitrc -> $HOME/.xinitrc`.
```
ln -s /home/$USER/.config/.xinitrc /home/$USER/.xinitrc
```
- Link `$HOME/.config/.zshrc -> $HOME/.zshrc`.
```
ln -s /home/$USER/.config/.zshrc /home/$USER/.zshrc
```
- Link `$HOME/.config/.vim-> $HOME/.vimrc`.
```
ln -s /home/$USER/.config/.vimrc /home/$USER/.vimrc
```
- Link `/etc/ly/config.ini -> $HOME/.config/ly/config.ini`.
```
ln -s /home/$USER/.config/ly/config.ini /etc/ly/config.ini
```
- Enable `ly@tty1.service` and disable `getty@tty1.service`.
```
systemctl enable ly@tty1
systemctl disable getty@tty
```
- Edit i3/i3status.toml to comment/uncomment ethernet and/or wifi blocks.
- [Firefox based web browsers]: Set `widgeuse-xdg-desktop-portal.file-picker` to 0 in about:config tab.
- Move files such as `.zshrc`, `.xinitrc` and `.vimrc` to `$HOME` directory.
- Install [ranger-zoxide](https://github.com/jchook/ranger-zoxide) plugin
- Enable `bluetooth.service`
```
systemctl enable bluetooth
```
- Create links to .desktop files.
```
ln -s /home/$USER/.config/applications/* /home/$USER/.local/share/applications
```
