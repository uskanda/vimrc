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
NeoBundle 'motemen/git-vim'
NeoBundle 'YankRing.vim' "ヤンク後C-n,C-pでYankring
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

""""""""""""""""""""""""""""""""""""""""
" General Settings
""""""""""""""""""""""""""""""""""""""""
set number
set smarttab                                      " 頭の余白内で <Tab> を打ち込むと空白を挿入
set expandtab                                     " tab文字をスペースに展開
set tabstop=4                                     " <Tab>を押したときの空白文字数
set shiftwidth=4                                  " インデント時の空白数
set infercase                                     " 小文字で打った単語でも大文字で補完できるようにする
set ignorecase                                    " 検索で大文字小文字を区別しない
set textwidth=0                                   " 勝手に改行しないようにする
set noswapfile
set nobk "disable auto backup 
""""""""""""""""""""""""""""""""""""""""

set autowrite "auto save
autocmd CursorHold *  wall
autocmd CursorHoldI *  wall

"ノーマルモードではセミコロンをコロン扱いする
nnoremap ; :

inoremap jj <ESC> " in insert mode, jj means <ESC>.

""""""""""""""""""""""""""""""""""""""""
" unite.vim
""""""""""""""""""""""""""""""""""""""""
" 入力モードで開始する
let g:unite_enable_start_insert=1
nnoremap <silent> ,p :<C-u>call <SID>unite_project('-start-insert')<CR>

function! s:unite_project(...)
	  let opts = (a:0 ? join(a:000, ' ') : '')
	    let dir = unite#util#path2project_directory(expand('%'))
	      execute 'Unite' opts 'file_rec:' . dir
endfunction
""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""
"neocomplcache設定
""""""""""""""""""""""""""""""""""""""""
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_camel_case_completion = 0
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*unite\*'
""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""
"NERDTree設定
""""""""""""""""""""""""""""""""""""""""
map ,d :execute 'NERDTreeToggle ' . getcwd()<CR>
""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""
"拡張子設定
""""""""""""""""""""""""""""""""""""""""
autocmd BufNewFile,BufRead *.less set filetype=css
autocmd BufNewFile,BufRead *.as set filetype=actionscript
""""""""""""""""""""""""""""""""""""""""

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
