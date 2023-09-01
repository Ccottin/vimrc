#!/bin/bash

#if an error is encountered, script will exit with its status and stop execute

set -e

cd ~/.vim_runtime

let data_dir = "~/.vim_runtime"
if !isdirectory(glob(data_dir . "/plugged"))
	autocmd VimEnter * PlugInstall --sync | source ~/.vimrc
	autocmd VimEnter * NERDTree
endif

cp  ./.vimrc ~/

if [ -d ~/.vim ];
then
	if [ ! -f ~/.vim/coc-settings.json ];
	then
		cat coc-settings.json > ~/.vim/coc-settings.json
	fi
else
	mkdir ~/.vim
	cat coc-settings.json > ~/.vim/coc-settings.json
fi

echo "Good :)"
