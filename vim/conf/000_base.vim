"-------------------------------------------------------------------------------
" 基本設定
" 基本的な設定周りはここに入れる
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

