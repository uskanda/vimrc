set nocompatible

""""""""""""""""""""""""""""""""""""""""
" Package Manager
""""""""""""""""""""""""""""""""""""""""
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#rc(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'unite.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'groenewege/vim-less'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'mattn/zencoding-vim'
NeoBundle 'jeffreyiacono/vim-colors-wombat'
NeoBundle 'surround.vim'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'jamestomasino/actionscript-vim-bundle'
NeoBundle 'scrooloose/nerdtree' 
NeoBundle 'tpope/vim-rails'
NeoBundleLazy 'skwp/vim-rspec', { 'autoload': { 'filetypes': ['ruby', 'eruby', 'haml'] } }
NeoBundleLazy 'ruby-matchit', { 'autoload' : { 'filetypes': ['ruby', 'eruby', 'haml'] } }
NeoBundleLazy 'skammer/vim-css-color', { 'autoload' : { 'filetypes': ['css'] } }
""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""
" Builtin Package
""""""""""""""""""""""""""""""""""""""""
" Match Complex Parentheses
source $VIMRUNTIME/macros/matchit.vim
""""""""""""""""""""""""""""""""""""""""



set nobk "disable auto backup 

set autowrite "auto save
autocmd CursorHold *  wall
autocmd CursorHoldI *  wall

"ノーマルモードではセミコロンをコロン扱いする
nnoremap ; :

inoremap jj <ESC> " in insert mode, jj means <ESC>.

""" unite.vim
" 入力モードで開始する
let g:unite_enable_start_insert=1
nnoremap <silent> ,p :<C-u>call <SID>unite_project('-start-insert')<CR>

function! s:unite_project(...)
	  let opts = (a:0 ? join(a:000, ' ') : '')
	    let dir = unite#util#path2project_directory(expand('%'))
	      execute 'Unite' opts 'file_rec:' . dir
endfunction

"NERDTree設定
map ,d :execute 'NERDTreeToggle ' . getcwd()<CR>

"拡張子設定
autocmd BufNewFile,BufRead *.less set filetype=css
autocmd BufNewFile,BufRead *.as set filetype=actionscript

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

NeoBundleCheck
