"-------------------------------------------------------------------------------
" BUNDLE系
"-------------------------------------------------------------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" dein.vimのディレクトリ
let s:base_dir = expand('~/.config/nvim')
let s:dein_dir = expand('~/.cache/dein')
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " 管理するプラグインを記述したファイル
  let s:toml = s:base_dir . '/dein/dein.toml'
  let s:lazy_toml = s:base_dir . '/dein/dein_lazy.toml'
  call dein#load_toml(s:toml, {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif
