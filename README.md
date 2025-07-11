# Arch linux and hyprland dot-files

## Connect to wifi from tty
`nmcli device` and then `nmcli device wifi connect <SSID> password <password>`

## Install basics
`sudo pacman -S ghostty hyprland git`

## Install yay 
```bash
sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
```

## Apply
```bash
yay -S clang cmake fish hyprshot-gui-git less lua-language-server materiak-gtk-theme nemo neovim nwg-look pavucontrol pulseaudio ripgrep swww tldr tree ttf-fira-code-nerd unzip waybar wl-clipboard wofi xkb-qwerty-fr zip librewolf-bin
```

- Kitty theme : Arthur, using `kitten`
- GTK theme : Materia `nwg-look`
- Monitor default : `, preferred, auto, 1`
- Make fish the default shell : `sudo chsh -s /usr/bin/fish`
