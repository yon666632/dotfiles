"-------------------------------------------------------------------------------
" common
"-------------------------------------------------------------------------------
set encoding=utf8                 "エンコーディング設定
set fileencoding=utf-8            "カレントバッファ内のファイルの文字エンコーディングを設定する
set scrolloff=5                   "カーソルの上または下に表示する最小限の行数
set autoread                      "他で書き換えられた場合、自動で読みなおす
set hidden                        "編集中でも他のファイルを開けるようにする
set backspace=indent,eol,start    "backspaceで消せるようにする
set vb t_vb=                      "ビープ音を鳴らさない
set clipboard+=unnamedplus        "OSのクリップボードを使用する
set list                          "タブ文字、行末など不可視文字を表示する
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
set relativenumber                "その他の行は相対値
set number                        "現在行は絶対値
set ruler                         "カーソルが何行目の何列目に置かれているかを表示する
set nocompatible
set nostartofline
autocmd FileType * setlocal formatoptions-=ro

" backup,swap,undo,viminfo
set backup
set backupdir=$HOME/.config/nvim/backup
set swapfile
set directory=$HOME/.config/nvim/swap
set undofile
set undodir=$HOME/.config/nvim/undo
set viminfo+=n~/.config/nvim/viminfo/.viminfo

"insertモード時のESCをリマップ
inoremap <c-[> <esc>

"x キー削除でデフォルトレジスタに入れない
nnoremap x "_x
vnoremap x "_x

"vv で行末まで選択
vnoremap v ^$h

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
vnoremap { "zdi^V{<C-R>z}<ESC>
vnoremap [ "zdi^V[<C-R>z]<ESC>
vnoremap ( "zdi^V(<C-R>z)<ESC>

"-------------------------------------------------------------------------------
" command
"-------------------------------------------------------------------------------
:command Tbn tabnext
:command Tbp tabprevious

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
set autoindent
set tabstop=4           "ファイル内の <tab> が対応する空白の数
set shiftwidth=4
set softtabstop=0       "キーボードから入るタブの数
set expandtab           "Insertモードで<tab> を挿入するのに、適切な数の空白を使う
set smarttab            "行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする
set cindent             "Cプログラムファイルの自動インデントを始める
set smartindent         "改行時に入力された行の末尾に合わせて次の行のインデントを増減する 
