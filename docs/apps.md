# Install and configure apps

## Install apps
```
sudo pacman -S man-pages man-db git
```

## yay
```
mkdir ~/aur
mkdir ~/aur/yay
git clone https://aur.archlinux.org/yay.git ~/aur/yay
cd ~/aur/yay
makepkg -si
```

## zsh
```
yay -S zsh oh-my-zsh-git
chsh -s $(which zsh)
touch ~/.zshrc
vim ~/.zshrc
```

Add the following content to the `~/.zshrc` file:
```
ZSH=/usr/share/oh-my-zsh/
ZSH_THEME="robbyrussell"
plugins=(
  git
)
source $ZSH/oh-my-zsh.sh
bindkey -v
```

## i3
```
sudo pacman -S xorg-server xorg-xinit xorg-xrandr i3-wm i3status termite
echo "exec i3" > ~/.xinitrc
touch ~/.zprofile
vim ~/.zprofile
```

Add the following content to the file:

```
if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx
fi
```

Run the commands:

```
sudo touch /etc/X11/xorg.conf.d/xorg.conf
sudo vim /etc/X11/xorg.conf.d/xorg.conf
```

Add the following content to the file:

```
Section "Monitor"
        Identifier   "Monitor0"
        Option "PreferredMode" "1400x900"
        Option "DPMS"
EndSection

Section "Screen"
        Identifier "Screen0"
        Device     "Card0"
        Monitor    "Monitor0"
        DefaultDepth 24
        SubSection "Display"
            Modes "1400x900" "1280x800" "1360x768" "1280x800" "1152x864" "1280x768" "1024x768" "800x600" "640x480"
        EndSubSection
EndSection
```
 
Exit and login to start X and select Alt as a Mod1

## XDG Autostart
```
sudo pacman -S dex
vim ~/.config/i3/config
```

Add to the end of the file:

```
exec dex -ae i3
```

## virtualbox
```
sudo pacman -S virtualbox-guest-utils xf86-video-vmware
```

Select `virtualbox-guest-modules-arch`

Enable shared clipboard on the server Virtual Box configuration

```
reboot
```

## Clean unused dependencies
```
sudo pacman -Rns $(pacman -Qdtq)
yay -Yc
```