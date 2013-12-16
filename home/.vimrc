""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"# Vim設定の詳細
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"設定ごとの詳細を書きます。
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"## プラグインの提供機能別索引
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"* [Vimでもともと設定可能な代表的オプションが知りたい - 基本設定](#neobundle) 
"* [Vimプラグインを管理したい - NeoBundle](#neobundle) 
"* [ファイルに変更があったら自動的にセーブしたい - オートセーブ](#autosave) 
"* [ノーマルモードでのコロンの入力が面倒 - セミコロンをコロン扱いにする](#important_keybind)
"* [インサートモード終了時にEscを押すのが面倒 - 特定の文字入力でインサートモードを終了する](#important_keybind)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"## <a name="basics">基本設定
"`````````````````````````````````````````````````````````````
" vi互換でなく、Vimデフォルト設定にする
set nocompatible
set encoding=utf-8                 " 文字コードをUTF-8に設定する
set ambiwidth=double               
set number                         " ファイル左に行番号を表示する
set relativenumber                 " カーソルの位置する行からの差分行数を表示する。set number時の挙動を一部上書きする
set smarttab                       " 頭の余白内で <Tab> を打ち込むと空白を挿入
set expandtab                      " tab文字をスペースに展開
set tabstop=4                      " <Tab>を押したときの空白文字数
set shiftwidth=4                   " インデント時の空白数
set infercase                      " 小文字で打った単語でも大文字で補完できるようにする
set ignorecase                     " 検索で大文字小文字を区別しない
set textwidth=0                    " 勝手に改行しないようにする
set noswapfile
set nobk                           " バックアップの作成をしないようにする
if has('kaoriya')
    set imdisable                  " インサートモードから抜けるときにIMEを必ずオフにする:要kaoriya版
endif
"`````````````````````````````````````````````````````````````


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"## <a name="neobundle">Vimプラグインの管理 - NeoBundle
" [NeoBundle](https://github.com/Shougo/neobundle.vim)を使ってプラグインの管理をします。
" 利用するプラグインを記述しておくと、起動時に自動的にインストールされていない
" プラグインを検知し、インストールします。
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"### NeoBundle本体の読み込み・設定
"`````````````````````````````````````````````````````````````
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#rc(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'            "プラグイン管理
"`````````````````````````````````````````````````````````````
"### 読み込むプラグインの指定
"github上に公開されているプラグインの場合、 `NeoBundle {ユーザ名/レポジトリ名}` で
"読み込むことができます。  
"`````````````````````````````````````````````````````````````
NeoBundle 'unite.vim'                            "QuickSilver/anything.elライクな検索
NeoBundle 'h1mesuke/unite-outline'
NeoBundle 'tsukkee/unite-help'
NeoBundle 'groenewege/vim-less'                 "lessファイル
NeoBundle 'slim-template/vim-slim'
NeoBundle 'kchmck/vim-coffee-script'            "coffeescript
NeoBundle 'mattn/emmet-vim'                     "zen-coding
NeoBundle 'jeffreyiacono/vim-colors-wombat'     "カラースキーム
"`````````````````````````````````````````````````````````````
"### 遅延読み込み
"特定の拡張子のファイルに対してのみ必要なプラグイン等、
"必要なケースが限られているプラグインについては、`NeoBundleLazy` をNeoBundleのかわりに用いることで、
"Vimの起動速度を改善できます。
"`````````````````````````````````````````````````````````````
NeoBundleLazy 'ap/vim-css-color', { 'autoload' : { 'filetypes': ['css'] } }
NeoBundleLazy 'skwp/vim-rspec', { 'autoload': { 'filetypes': ['ruby', 'eruby', 'haml'] } }
NeoBundleLazy 'ruby-matchit', { 'autoload' : { 'filetypes': ['ruby', 'eruby', 'haml'] } }
"`````````````````````````````````````````````````````````````
"neocompleteはlua必須 
function! s:meet_neocomplete_requirements()
    return has('lua') && (v:version > 703 || (v:version == 703 && has('patch885')))
endfunction
if s:meet_neocomplete_requirements()
    NeoBundle 'Shougo/neocomplete.vim'
endif
NeoBundle 'surround.vim'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'Highlight-UnMatched-Brackets'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'motemen/git-vim'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'YankRing.vim' "ヤンク後C-n,C-pでYankring
NeoBundle 'glidenote/octoeditor.vim'
NeoBundle 'kana/vim-arpeggio'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'kakkyz81/evervim'
NeoBundle 'osyo-manga/vim-gift'
NeoBundle 'osyo-manga/vim-automatic'
NeoBundle 'rhysd/clever-f.vim'
NeoBundle 'rhysd/conflict-marker.vim'
NeoBundle 'osyo-manga/vim-anzu'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
    \ 'windows' : 'make -f make_mingw32.mak',
    \ 'cygwin' : 'make -f make_cygwin.mak',
    \ 'mac' : 'make -f make_mac.mak',
    \ 'unix' : 'make -f make_unix.mak',
  \ },
\ }
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" mapping
nmap n <Plug>(anzu-n-with-echo)
nmap N <Plug>(anzu-N-with-echo)
nmap * <Plug>(anzu-star-with-echo)
nmap # <Plug>(anzu-sharp-with-echo)
" clear status
nmap <Esc><Esc> <Plug>(anzu-clear-search-status)
" statusline
set statusline=%{anzu#search_status()}

""""""""""""""""""""""""""""""""""""""""
" Vimビルトインのプラグイン読み込み
""""""""""""""""""""""""""""""""""""""""
" Match Complex Parentheses
source $VIMRUNTIME/macros/matchit.vim
""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"## <a name="autosave">ファイルに変更を加えたら自動的にセーブする - Auto-Save 
"[vim-scripts/vim-auto-save](https://github.com/vim-scripts/vim-auto-save)  
"バージョン管理システムを利用しているのならば、毎回ファイルをセーブするコマンドを打つのは時間の無駄です。
"ファイルに変更があったら即セーブするようにしてしまいましょう。
"`````````````````````````````````````````````````````````````
NeoBundle 'vim-scripts/vim-auto-save'

" デフォルトで有効にする
let g:auto_save = 1
"`````````````````````````````````````````````````````````````

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"## <a name="important_keybind">影響の大きいキー設定
"### ノーマルモードではセミコロンをコロン扱いする
"`````````````````````````````````````````````````````````````
nnoremap ; :
"`````````````````````````````````````````````````````````````
"### インサートモードで"j"を２回押すとノーマルモードに戻る
"`````````````````````````````````````````````````````````````
inoremap jj <ESC> " in insert mode, jj means <ESC>.
"`````````````````````````````````````````````````````````````

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"## <a name="unite">Unite.vim
"[Shougo/unite.vim](https://github.com/Shougo/unite.vim)  
"使いやすい検索インタフェースを提供してくれます。
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"`````````````````````````````````````````````````````````````
" 入力モードで開始する
let g:unite_enable_start_insert=1
" 大文字小文字を区別しない
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1
"`````````````````````````````````````````````````````````````
"### 現在のバッファと同一プロジェクト内のファイル検索
"キーバインド: ,p
"VCSの同一管理下にあるファイルを同一プロジェクトとみなし、
"同一プロジェクト内のファイル検索を行います。
"`````````````````````````````````````````````````````````````
nnoremap <silent> ,p :<C-u>call <SID>unite_project('-start-insert')<CR>

function! s:unite_project(...)
  let opts = (a:0 ? join(a:000, ' ') : '')
    let dir = unite#util#path2project_directory(expand('%'))
      execute 'Unite' opts 'file_rec:' . dir
endfunction
"`````````````````````````````````````````````````````````````

"http://blog.monochromegane.com/blog/2013/09/18/ag-and-unite/
" grep検索
nnoremap <silent> ,s  :<C-u>Unite grep:. -buffer-name=search-buffer<CR>
" カーソル位置の単語をgrep検索
nnoremap <silent> ,cs :<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R><C-W>
" grep検索結果の再呼出
nnoremap <silent> ,r  :<C-u>UniteResume search-buffer<CR>

" unite grep に ag(The Silver Searcher) を使う
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif

nnoremap <silent> ,uo :<C-u>Unite outline<CR>
nnoremap <silent> ,uh :<C-u>Unite help<CR>
"```

""""""""""""""""""""""""""""""""""""""""
"## 補完 - Neocomplete
"[Shougo/neocomplete.vim](https://github.com/Shougo/neocomplete.vim)
"`````````````````````````````````````````````````````````````
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#auto_completion_start_length = 2
let g:neocomplete#manual_completion_start_length = 0
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#min_keyword_length = 2
let g:neocomplete#lock_buffer_name_pattern = '\*unite\*'
let g:neocomplete#enable_prefetch = 1

let g:neocomplete#enable_camel_case_completion = 0
let g:neocomplete#enable_underbar_completion = 1
inoremap <expr><CR>  neocomplete#smart_close_popup() . "\<CR>"
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

autocmd FileType css,less,sass setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
"`````````````````````````````````````````````````````````````

""""""""""""""""""""""""""""""""""""""""
"## スニペット - Neosnippet
"`````````````````````````````````````````````````````````````
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif
"`````````````````````````````````````````````````````````````

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


let g:lightline.tabline = {
      \ 'left': [ [ 'tabs' ] ],
      \ 'right': [ [ 'close' ] ] }

" ## Tablineキーバインド
" TODO: use prefix key
" Tab jump
for n in range(1, 9)
  execute 'nnoremap <silent> t'.n  ':<C-u>tabnext'.n.'<CR>'
endfor
" t1 で1番左のタブ、t2 で1番左から2番目のタブにジャンプ

nmap <silent> tc :tablast <bar> tabnew<CR>
" tc 新しいタブを一番右に作る
nmap <silent> tx :tabclose<CR>
" tx タブを閉じる
nmap <silent> tn :tabnext<CR>
nmap <silent> tt :tabnext<CR>
" tn 次のタブ
nmap <silent> tp :tabprevious<CR>
" tp 前のタブ
