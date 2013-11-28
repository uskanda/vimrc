colorscheme wombat
set background=dark
set transparency=1

if has("gui_running")
	set guifont=Ricty\ For\ Powerline:h14
	set fuoptions=maxvert,maxhorz
	au GUIEnter * set fullscreen
endif
command Fullscreen :emenu Window.Toggle\ Full\ Screen\ Mode

