""""""""""""""""""""""""""""""""""""""""
" Package Manager
""""""""""""""""""""""""""""""""""""""""
" Vundle を初期化して
" Vundle 自身も Vundle で管理
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'tpope/vim-rails'
Bundle 'unite.vim'
Bundle 'Shougo/neocomplcache'
Bundle 'groenewege/vim-less'
Bundle 'kchmck/vim-coffee-script'
Bundle 'mattn/zencoding-vim'
Bundle 'surround.vim'
""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""
" Builtin Package
""""""""""""""""""""""""""""""""""""""""
" Match Complex Parentheses
source $VIMRUNTIME/macros/matchit.vim
""""""""""""""""""""""""""""""""""""""""


"disable auto backup
set nobk

"auto save
set autowrite
autocmd CursorHold *  wall
autocmd CursorHoldI *  wall

"ノーマルモードではセミコロンをコロン扱いする
nnoremap ; :

" in insert mode, jj means <ESC>.
inoremap jj <ESC>

""" unite.vim
" 入力モードで開始する
let g:unite_enable_start_insert=1
nnoremap <silent> ,p :<C-u>call <SID>unite_project('-start-insert')<CR>

function! s:unite_project(...)
	  let opts = (a:0 ? join(a:000, ' ') : '')
	    let dir = unite#util#path2project_directory(expand('%'))
	      execute 'Unite' opts 'file_rec:' . dir
endfunction

"LESS補完設定
autocmd BufNewFile,BufRead *.less set filetype=css

" バッファ一覧
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
" ファイル一覧
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" レジスタ一覧
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
" " 最近使用したファイル一覧
nnoremap <silent> ,um :<C-u>Unite file_mru<CR>
" " 常用セット
nnoremap <silent> ,uu :<C-u>Unite buffer file_mru<CR>
nnoremap <silent> ,, :<C-u>Unite buffer file_mru<CR>

" ファイル形式検出、プラグイン、インデントを ON
filetype plugin indent on 
