#!/bin/bash

input() {
	echo "[?] $@"

	read -r out

	echo $out
}

backup() {
	cp ~/{.vimrc,.vimrc.bak}
}

RES=$(input "Do you want to backup your vimrc? (only use this if you're not using my vim dots) [y/N]")

if [ "$RES" == "y" ]; then
	backup
fi

[ -d "~/.vimrc" ] && rm -rf ~/.vimrc
[ -d "~/.config/vim" ] && rm -rf ~/.config/vim

cp .vimrc ~/.vimrc
cp .config/vim ~/.config/vim
