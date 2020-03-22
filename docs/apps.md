# Install and configure apps

## Install apps
```
pacman -S --noconfirm man-pages man-db git
```

## yay
```
mkdir ~/aur
mkdir ~/aur/yay
git clone https://aur.archlinux.org/yay.git ~/aur/yay
cd ~/aur/yay
makepkg -si --noconfirm
```

## zsh
```
yay -S --noconfirm zsh oh-my-zsh-git
#zsh /usr/share/zsh/functions/Newuser/zsh-newuser-install -f
chsh -s $(which zsh)
#bash /usr/share/oh-my-zsh/tools/install.sh
```

## git
```
TBD
```

## Clean unused dependencies
```
pacman -Rns --noconfirm $(pacman -Qdtq)
yay -Yc --noconfirm
```