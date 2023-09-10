#!/bin/bash

backup() {
	echo "[*] Creating backup for .vimrc"
	cp ~/{.vimrc,.vimrc.bak}
}

echo -ne "Do you want to backup your vimrc? (only use this if you're not using my vim dots) [y/N] "
read -r out

if [ "$out" = "y" ]; then
	backup
fi

[ -d "~/.vimrc" ] && rm -rf ~/.vimrc
[ -d "~/.config/vim" ] && rm -rf ~/.config/vim

echo "[*] Installing .vimrc"
cp -r .vimrc ~/.vimrc

echo "[*] Installing ~/.config/vim"
cp -r .config/vim ~/.config/vim
