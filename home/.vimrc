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
NeoBundle 'h1mesuke/unite-outline'
NeoBundle 'tsukkee/unite-help'
function! s:meet_neocomplete_requirements()
    return has('lua') && (v:version > 703 || (v:version == 703 && has('patch885')))
endfunction
if s:meet_neocomplete_requirements()
    NeoBundle 'Shougo/neocomplete.vim'
endif
NeoBundle 'groenewege/vim-less'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'jeffreyiacono/vim-colors-wombat'
NeoBundle 'surround.vim'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'jamestomasino/actionscript-vim-bundle'
NeoBundle 'Highlight-UnMatched-Brackets'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'motemen/git-vim'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'YankRing.vim' "ヤンク後C-n,C-pでYankring
NeoBundleLazy 'skwp/vim-rspec', { 'autoload': { 'filetypes': ['ruby', 'eruby', 'haml'] } }
NeoBundleLazy 'ruby-matchit', { 'autoload' : { 'filetypes': ['ruby', 'eruby', 'haml'] } }
NeoBundleLazy 'skammer/vim-css-color', { 'autoload' : { 'filetypes': ['css'] } }
NeoBundle 'glidenote/octoeditor.vim'
NeoBundle 'kana/vim-arpeggio'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'kakkyz81/evervim'
NeoBundle 'osyo-manga/vim-gift'
NeoBundle 'osyo-manga/vim-automatic'
NeoBundle 'rhysd/clever-f.vim'
NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
    \ 'windows' : 'make -f make_mingw32.mak',
    \ 'cygwin' : 'make -f make_cygwin.mak',
    \ 'mac' : 'make -f make_mac.mak',
    \ 'unix' : 'make -f make_unix.mak',
  \ },
\ }
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

""""""""""""""""""""""""""""""""""""""""
" オートセーブ
""""""""""""""""""""""""""""""""""""""""
set autowrite
set updatetime=500

autocmd CursorHold * silent! wall
autocmd CursorHoldI * silent! wall
""""""""""""""""""""""""""""""""""""""""

"ノーマルモードではセミコロンをコロン扱いする
nnoremap ; :

inoremap jj <ESC> " in insert mode, jj means <ESC>.

""""""""""""""""""""""""""""""""""""""""
" unite.vim
""""""""""""""""""""""""""""""""""""""""
" 入力モードで開始する
let g:unite_enable_start_insert=1
nnoremap <silent> ,p :<C-u>call <SID>unite_project('-start-insert')<CR>
nnoremap <silent> ,up :<C-u>call <SID>unite_project('-start-insert')<CR>

function! s:unite_project(...)
  let opts = (a:0 ? join(a:000, ' ') : '')
    let dir = unite#util#path2project_directory(expand('%'))
      execute 'Unite' opts 'file_rec:' . dir
endfunction
""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""
" unite commands
""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> ,uo :<C-u>Unite outline<CR>
nnoremap <silent> ,uh :<C-u>Unite help<CR>
""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""
"neocomplete設定
""""""""""""""""""""""""""""""""""""""""
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete_enable_at_startup = 1
let g:neocomplete_enable_smart_case = 1
let g:neocomplete_enable_camel_case_completion = 0
let g:neocomplete_enable_underbar_completion = 1
let g:neocomplete_min_syntax_length = 3
let g:neocomplete_lock_buffer_name_pattern = '\*unite\*'
inoremap <expr><CR>  neocomplete#smart_close_popup() . "\<CR>"
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""
"NERDTree設定
""""""""""""""""""""""""""""""""""""""""
map ,d :execute 'NERDTreeToggle ' . getcwd()<CR>
""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""
" clever-f
""""""""""""""""""""""""""""""""""""""""
let g:clever_f_smart_case = 1
""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""
" Octoeditor
""""""""""""""""""""""""""""""""""""""""
map ,on  :OctopressNew<CR>
map ,ol  :OctopressList<CR>
map ,og  :OctopressGrep<CR>
nmap ,og  :OctopressGenerate<CR>
nmap ,od  :OctopressDeploy<CR>
""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""
" Evervim
""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> ,el :<C-u>EvervimNotebookList<CR>
nnoremap <silent> ,eT :<C-u>EvervimListTags<CR>
nnoremap <silent> ,en :<C-u>EvervimCreateNote<CR>
nnoremap <silent> ,eb :<C-u>EvervimOpenBrowser<CR>
nnoremap <silent> ,ec :<C-u>EvervimOpenClient<CR>
nnoremap ,es :<C-u>EvervimSearchByQuery<SPACE>
nnoremap <silent> ,et :<C-u>EvervimSearchByQuery<SPACE>tag:todo -tag:done -tag:someday<CR>
nnoremap <silent> ,eta :<C-u>EvervimSearchByQuery<SPACE>tag:todo -tag:done<CR>
""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""
" fugitive
""""""""""""""""""""""""""""""""""""""""
nnoremap ,gd :<C-u>Gdiff<Enter>
nnoremap ,gs :<C-u>Gstatus<Enter>
nnoremap ,gl :<C-u>Glog<Enter>
nnoremap ,ga :<C-u>Gwrite<Enter>
nnoremap ,gc :<C-u>Gcommit<Enter>
nnoremap ,gC :<C-u>Git commit --amend<Enter>
nnoremap ,gb :<C-u>Gblame<Enter>
""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""
"拡張子設定
""""""""""""""""""""""""""""""""""""""""
autocmd BufNewFile,BufRead *.less set filetype=css
autocmd BufNewFile,BufRead *.as set filetype=actionscript
""""""""""""""""""""""""""""""""""""""""



" ファイル一覧
nnoremap <silent> ,f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" レジスタ一覧
nnoremap <silent> ,r :<C-u>Unite -buffer-name=register register<CR>
" " 常用セット
nnoremap <silent> ,, :<C-u>Unite buffer file_mru<CR>

" ファイル形式検出、プラグイン、インデントを ON
filetype plugin indent on

if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif

""""""""""""""""""""""""""""""""""""""""
":Renameでファイルリネーム
""""""""""""""""""""""""""""""""""""""""
command! -nargs=1 -complete=file Rename f <args>|call delete(expand('#'))
""""""""""""""""""""""""""""""""""""""""


let g:automatic_config = [
\   {
\       "match" : {
\           "bufname" : '__EVERVIM_LIST__',
\       },
\       "set" : {
\           'columns' : 30,
\           'move' : "left",
\           'is_close_focus_out' : 1,
\       },
\   },
\]

NeoBundleCheck

let g:lightline = {
\ 'colorscheme': 'wombat',
\ 'component': {
\   'readonly': '%{&readonly?"⭤":""}',
\   'dir': '%.50(%{expand("%:h:s?\\S$?\\0/?")}%)',
\ },
\ 'active': {
\   'left': [ [ 'mode', 'paste'],  ['readonly', 'dir', 'filename' ], ['fugitive', 'gitgutter', 'modified' ] ]
\ },
\ 'component_function': {
\   'fugitive': 'MyFugitive',
\   'gitgutter': 'MyGitGutter',
\ },
\ 'separator': { 'left': '⮀', 'right': '⮂' },
\ 'subseparator': { 'left': '⮁', 'right': '⮃' }
\ }


function! MyFugitive()
  try
    if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
      let _ = fugitive#head()
      return strlen(_) ? '⭠ '._ : ''
    endif
  catch
  endtry
  return ''
endfunction

function! MyGitGutter()
  if ! exists('*GitGutterGetHunkSummary')
        \ || ! get(g:, 'gitgutter_enabled', 0)
        \ || winwidth('.') <= 90
    return ''
  endif
  let symbols = [
        \ g:gitgutter_sign_added . ' ',
        \ g:gitgutter_sign_modified . ' ',
        \ g:gitgutter_sign_removed . ' '
        \ ]
  let hunks = GitGutterGetHunkSummary()
  let ret = []
  for i in [0, 1, 2]
    if hunks[i] > 0
      call add(ret, symbols[i] . hunks[i])
    endif
  endfor
  return join(ret, ' ')
endfunction

