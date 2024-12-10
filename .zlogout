#!/usr/bin/env zsh
###########################################
##  filename:    	.zlogut
##  filepath:     	/home/ZSH
##  author:       	mxx
##  file save date:   
##  file creation date [yy-mmm]: 23 nov
##  file status		 work in progess
##  comments: 	   - ^e edit
###########################################
cp --force "$ZDOTDIR/.zshrc" "$ZDOTDIR/bkp/zlogout.zshrc.zsh" && cp "$HOME/.zshenv" "$ZDOTDIR/bkp/zlogout.zshenv.zsh"  && cp --force "$ZDOTDIR/aliases.zsh" "$ZDOTDIR/bkp/zlogout.aliases.zsh"

exa /var/lib/dpkg/info/*.list --sort=created --long --no-permissions --no-user --no-filesize > $HOME/share/deb/$(date +%F)-dpkg-list.txt > "$ZDOTDIR/bkp/$(date +%F)-dpkg-list.txt"  

echo "llllllllllllllllloooooooooooooooooooooooooolllllllllllllllll"
sleep 4
