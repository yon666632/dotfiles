syntax on

"-------------------------------------------------------------------------------
" 基本設定
"-------------------------------------------------------------------------------
set encoding=utf8                 "エンコーディング設定

set fileencoding=utf-8            "カレントバッファ内のファイルの文字エンコーディングを設定する
set scrolloff=5                   "カーソルの上または下に表示する最小限の行数
set backupdir=$HOME/.vim/backup
set directory=$HOME/.vim/backup
set backupskip=/tmp/*,/private/tmp/*
set autoread                      "他で書き換えられた場合、自動で読みなおす
set noswapfile                    "swapをつくらない
set hidden                        "編集中でも他のファイルを開けるようにする
set backspace=indent,eol,start    "backspaceで消せるようにする
set vb t_vb=                      "ビープ音を鳴らさない
set clipboard=unnamed,autoselect  "OSのクリップボードを使用する
set list                          "タブ文字、行末など不可視文字を表示する
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
highlight JpSpace cterm=underline ctermfg=Blue guifg=Blue
au BufRead,BufNew * match JpSpace /　/
set relativenumber                "その他の行は相対値
set number                        "現在行は絶対値
set ruler                         "カーソルが何行目の何列目に置かれているかを表示する
set nocompatible
set nostartofline
set autoindent                    "上の行にあわせてインデント入れる
autocmd FileType * set formatoptions-=ro

"-------------------------------------------------------------------------------
" Mapping <jump-tag>
"-------------------------------------------------------------------------------
" コマンド       ノーマルモード 挿入モード コマンドラインモード ビジュアルモード
" map/noremap           @            -              -                  @
" nmap/nnoremap         @            -              -                  -
" imap/inoremap         -            @              -                  -
" cmap/cnoremap         -            -              @                  -
" vmap/vnoremap         -            -              -                  @
" map!/noremap!         -            @              @                  -
"-------------------------------------------------------------------------------
"insertモード時のESCをリマップ
inoremap <c-[> <esc>

"emacs like
map! <c-a> <home>
map! <c-e> <end>
nnoremap <c-a> <home>
nnoremap <c-e> <end>

"インサートモードでも移動
inoremap <c-d> <delete>
inoremap <c-j> <down>
inoremap <c-k> <up>
inoremap <c-h> <left>
inoremap <c-l> <right>

"画面切り替え
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
nnoremap <c-h> <c-w>h

"-------------------------------------------------------------------------------
" 入力補完
"-------------------------------------------------------------------------------
inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>
vnoremap { "zdi^V{<C-R>z}<ESC>
vnoremap [ "zdi^V[<C-R>z]<ESC>
vnoremap ( "zdi^V(<C-R>z)<ESC>
vnoremap " "zdi^V"<C-R>z^V"<ESC>
vnoremap ' "zdi'<C-R>z'<ESC>

"-------------------------------------------------------------------------------
" 検索系
"-------------------------------------------------------------------------------
set ignorecase    "小文字の検索でも大文字も見つかるようにする
set smartcase     "ただし大文字も含めた検索の場合はその通りに検索する
set incsearch     "インクリメンタルサーチを行う
set nowrapscan    "(no)検索をファイルの末尾まで検索したら、ファイルの先頭へループする
set history=1000  "コマンド、検索パターンを100個まで履歴に残す

"-------------------------------------------------------------------------------
" タブ系
"-------------------------------------------------------------------------------
set tabstop=4     "ファイル内の <tab> が対応する空白の数
set autoindent
set shiftwidth=4
set expandtab     "Insertモードで<tab> を挿入するのに、適切な数の空白を使う
set smarttab      "行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする

"-------------------------------------------------------------------------------
" 連番ふる
"-------------------------------------------------------------------------------
nnoremap <silent> co :ContinuousNumber <C-a><CR>
vnoremap <silent> co :ContinuousNumber <C-a><CR>
command! -count -nargs=1 ContinuousNumber let snf=&nf|set nf-=octal|let cl = col('.')|for nc in range(1, <count>?<count>-line('.'):1)|exe 'normal! j' . nc . <q-args>|call cursor('.', cl)|endfor|unlet cl|unlet snf

"-------------------------------------------------------------------------------
" BUNDLE系
"-------------------------------------------------------------------------------
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
endif

call neobundle#rc(expand('~/.vim/bundle/'))

" Installation check.
if neobundle#exists_not_installed_bundles()
  echomsg 'Not installed bundles : ' .
        \ string(neobundle#get_not_installed_bundle_names())
  echomsg 'Please execute ":NeoBundleInstall" command.'
  "finish
endif

NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'davidoc/taskpaper.vim'
NeoBundle 'surround.vim'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'kana/vim-fakeclip.git'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'rking/ag.vim'
NeoBundle 'hotchpotch/perldoc-vim'
NeoBundle 'vim-perl/vim-perl'
NeoBundle 'Shougo/vimfiler'
NeoBundleCheck

"-------------------------------------------------------------------------------
" simplenote系
"-------------------------------------------------------------------------------
if filereadable(expand('~/.simplenoterc'))
    source ~/.simplenoterc
endif

"-------------------------------------------------------------------------------
" ctrlp系
"-------------------------------------------------------------------------------
let g:ctrlp_use_migemo = 1
let g:ctrlp_clear_cache_on_exit = 0   " 終了時キャッシュをクリアしない
let g:ctrlp_mruf_max            = 500 " MRUの最大記録数
let g:ctrlp_open_new_file       = 1   " 新規ファイル作成時にタブで開く

"-------------------------------------------------------------------------------
" NeoCompleteCache系
"-------------------------------------------------------------------------------
" 補完ウィンドウの設定
set completeopt=menuone
 
" 起動時に有効化
let g:neocomplcache_enable_at_startup = 1
 
" 大文字が入力されるまで大文字小文字の区別を無視する
let g:neocomplcache_enable_smart_case = 1
 
" _(アンダースコア)区切りの補完を有効化
let g:neocomplcache_enable_underbar_completion = 1
 
let g:neocomplcache_enable_camel_case_completion  =  1
 
" ポップアップメニューで表示される候補の数
let g:neocomplcache_max_list = 20
 
" シンタックスをキャッシュするときの最小文字長
let g:neocomplcache_min_syntax_length = 3

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : ''
    \ }

if !exists('g:neocomplcache_keyword_patterns')
        let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

"" スニペットを展開する。スニペットが関係しないところでは行末まで削除
"imap <expr><C-k> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : "\<C-o>D"
"smap <expr><C-k> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : "\<C-o>D"
 
" 前回行われた補完をキャンセルします
inoremap <expr><C-z> neocomplcache#undo_completion()
 
" 補完候補のなかから、共通する部分を補完します
inoremap <expr><C-c> neocomplcache#complete_common_string()
 
" 改行で補完ウィンドウを閉じる
inoremap <expr><CR> neocomplcache#smart_close_popup() . "\<CR>"
 
"tabで補完候補の選択を行う
inoremap <expr><TAB> pumvisible() ? "\<Down>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<Up>" : "\<S-TAB>"
 
" <C-h>や<BS>を押したときに確実にポップアップを削除します
inoremap <expr><C-q> neocomplcache#smart_close_popup().”\<C-q>”
 
" 現在選択している候補を確定します
inoremap <expr><C-y> neocomplcache#close_popup()
 
" 現在選択している候補をキャンセルし、ポップアップを閉じます
inoremap <expr><C-g> neocomplcache#cancel_popup()

"-------------------------------------------------------------------------------
" grep系
"-------------------------------------------------------------------------------
" 大文字小文字を区別しない
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1

" grep検索
nnoremap <silent> ,g  :<C-u>Unite grep:. -buffer-name=search-buffer<CR>

" カーソル位置の単語をgrep検索
nnoremap <silent> ,cg :<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R><C-W>

" grep検索結果の再呼出
nnoremap <silent> ,r  :<C-u>UniteResume search-buffer<CR>

" unite grep に ag(The Silver Searcher) を使う
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif

""-------------------------------------------------------------------------------
"" vimfiler系
""-------------------------------------------------------------------------------
"autocmd VimEnter * VimFiler -split -simple -winwidth=30 -no-quit
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_safe_mode_by_default = 0

""-------------------------------------------------------------------------------
"" perl用
""-------------------------------------------------------------------------------
augroup filetypedetect
autocmd! BufNewFile,BufRead *.t setf perl
autocmd! BufNewFile,BufRead *.psgi setf perl
autocmd! BufNewFile,BufRead *.tt setf tt2html
augroup END

autocmd BufNewFile *.pl 0r $HOME/.vim/template/perl-script.txt
autocmd BufNewFile *.t 0r $HOME/.vim/template/perl-script.txt

function! s:pm_template()
    let path = substitute(expand('%'), '.*lib/', '', 'g')
    let path = substitute(path, '[\\/]', '::', 'g')
    let path = substitute(path, '\.pm$', '', 'g')

    call append(0, 'package ' . path . ';')
    call append(1, 'use strict;')
    call append(2, 'use warnings;')
    call append(3, 'use utf8;')
    call append(4, '')
    call append(5, '')
    call append(6, '')
    call append(7, '1;')
    call cursor(6, 0)
    " echomsg path
endfunction
autocmd BufNewFile *.pm call s:pm_template()

function! s:get_package_name()
    let mx = '^\s*package\s\+\([^ ;]\+\)'
    for line in getline(1, 5)
        if line =~ mx
        return substitute(matchstr(line, mx), mx, '\1', '')
        endif
    endfor
    return ""
endfunction

function! s:check_package_name()
    let path = substitute(expand('%:p'), '\\', '/', 'g')
    let name = substitute(s:get_package_name(), '::', '/', 'g') . '.pm'
    if path[-len(name):] != name
        echohl WarningMsg
        echomsg "ぱっけーじめいと、ほぞんされているぱすが、ちがうきがします！"
        echomsg "ちゃんとなおしてください＞＜"
        echohl None
    endif
endfunction

au! BufWritePost *.pm call s:check_package_name()

" perl-tidyかけられるようにする
map ,pt <Esc>:%! perltidy -se<CR>
map ,ptv <Esc>:'<,'>! perltidy -se<CR>

filetype on
filetype indent on
filetype plugin on
