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
sudo pacman -S zsh
chsh -s $(which zsh)
```

## oh-my-zsh
```
git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
```

Enable vi mode by adding the following line to the end of `~/.zshrc`:

```
# Custom config
bindkey -v
```

## powerlevel9k
```
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
sudo pacman -Syu awesome-terminal-fonts
```

Add config into `~/.zshrc`:
```
POWERLEVEL9K_MODE='awesome-patched'
ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(time)
```

## i3
```
sudo pacman -S xorg-server xorg-xinit xorg-xrandr i3-gaps i3status termite
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

Run the command:

```
vim ~/.config/i3/config
```

Add the following content to the end of the file:

```
# i3-gaps
for_window [class=".*"] border pixel 1
gaps inner 10
smart_borders on
```

Replace i3bar config with the following:

```
TBD
```

Exit and login to start X and select Alt as a Mod1

## Screen resolution

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

## XDG Autostart
```
sudo pacman -S dex
vim ~/.config/i3/config
```

Add to the end of the file:

```
# XDG autostart
exec --no-startup-id dex -ae i3
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

## vifm

```
sudo pacman -S vifm
```

## feh

```
sudo pacman -S feh
feh --bg-fill ~/wallpapers/reuben-teo-fUZWpaUknyI-unsplash.jpg 
```

`~/.xinitrc`:

```
~/.fehbg &
```

## Clean unused dependencies
```
sudo pacman -Rns $(pacman -Qdtq)
yay -Yc
```