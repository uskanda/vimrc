mkdir -p ~/.vim/bundle
if [ ! -d bundle/neobundle ]; then
	git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
fi
ln -i ~/.vim/vimrc ~/.vimrc 
ln -i ~/.vim/gvimrc ~/.gvimrc 

if [ `uname` = "Darwin" ]; then
	defaults write org.vim.MacVim MMNativeFullScreen 0
fi
