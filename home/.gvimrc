colorscheme wombat
set background=dark
set transparency=1

set guioptions-=e

if has("gui_running")
	set guifont=Ricty\ For\ Powerline:h14
    if &guifont != 'Ricty\ For\ Powerline:h14'
        set guifont=Ricty:h14
        if &guifont != 'Ricty:h14'
            set guifont=Monaco:h14
        endif
    endif
	set fuoptions=maxvert,maxhorz
	au GUIEnter * set fullscreen
endif
command Fullscreen :emenu Window.Toggle\ Full\ Screen\ Mode

