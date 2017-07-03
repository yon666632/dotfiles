"-------------------------------------------------------------------------------
" BUNDLE系
"-------------------------------------------------------------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" dein.vimのディレクトリ
let s:dein_dir = expand('~/.vim/bundle')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" なければgit clone
if !isdirectory(s:dein_repo_dir)
  execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
endif
execute 'set runtimepath^=' . s:dein_repo_dir

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " 管理するプラグインを記述したファイル
  let s:toml = '~/.vim/dein/dein.toml'
  let s:lazy_toml = '~/.vim/dein/dein_lazy.toml'
  call dein#load_toml(s:toml, {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif
"NeoBundleFetch 'Shougo/neobundle.vim'
"NeoBundle 'Shougo/neocomplcache'
"NeoBundle 'Shougo/neosnippet'
"NeoBundle 'Shougo/neosnippet-snippets'
"NeoBundle 'Shougo/unite.vim'
"NeoBundle 'davidoc/taskpaper.vim'
"NeoBundle 'surround.vim'
"NeoBundle 'itchyny/lightline.vim'
"NeoBundle 'kana/vim-fakeclip.git'
"NeoBundle 'kien/ctrlp.vim'
"NeoBundle 'Shougo/vimproc'
"NeoBundle 'rking/ag.vim'
"NeoBundle 'hotchpotch/perldoc-vim'
"NeoBundle 'vim-perl/vim-perl'
"NeoBundle 'Shougo/vimfiler'
"NeoBundle 'mattn/jscomplete-vim'
"NeoBundle 'myhere/vim-nodejs-complete'
"NeoBundle 'jiangmiao/simple-javascript-indenter'
"NeoBundleLazy 'jelera/vim-javascript-syntax', {'autoload':{'filetypes':['javascript']}}
"NeoBundle 'scrooloose/syntastic'
"NeoBundle 'fatih/vim-go'
"NeoBundle 'Yggdroot/indentLine'
"NeoBundle 'davidhalter/jedi-vim'
"NeoBundle 'tomtom/tcomment_vim' " コメントON/OFFを手軽に実行
"NeoBundle 'chriskempson/vim-tomorrow-theme'
"NeoBundle 'scrooloose/nerdtree' " ファイルをtree表示してくれる
"NeoBundle 'soramugi/auto-ctags.vim'
"NeoBundle 'thinca/vim-quickrun'
"NeoBundle 'Shougo/unite-outline'
"" You can specify revision/branch/tag.
"NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }
