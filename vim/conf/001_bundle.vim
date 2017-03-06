"-------------------------------------------------------------------------------
" BUNDLE系
"-------------------------------------------------------------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
endif

call neobundle#begin(expand('~/.vim/bundle/'))

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
NeoBundle 'mattn/jscomplete-vim'
NeoBundle 'myhere/vim-nodejs-complete'
NeoBundle 'jiangmiao/simple-javascript-indenter'
NeoBundleLazy 'jelera/vim-javascript-syntax', {'autoload':{'filetypes':['javascript']}}
NeoBundle 'scrooloose/syntastic'
NeoBundle 'fatih/vim-go'
NeoBundle 'Yggdroot/indentLine'
NeoBundle 'davidhalter/jedi-vim'
NeoBundle 'tomtom/tcomment_vim' " コメントON/OFFを手軽に実行
NeoBundle 'chriskempson/vim-tomorrow-theme'
NeoBundle 'scrooloose/nerdtree' " ファイルをtree表示してくれる
NeoBundle 'soramugi/auto-ctags.vim'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'Shougo/unite-outline'
" You can specify revision/branch/tag.
NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }
call neobundle#end()
filetype plugin indent on
NeoBundleCheck
